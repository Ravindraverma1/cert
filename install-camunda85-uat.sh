#!/usr/bin/env bash
# =============================================================================
# Camunda 8.5 -> aks-ded-stg-weu-01 (UAT, PRIVATE)  | AUTH ON, behind APIM
# RUN ON: vm-mgmt-ded-stg-weu-01
# Deploys: dedicated internal nginx ingress (health-probe fix baked in) + Camunda
# APIM wiring is a SEPARATE step (apim-camunda-uat.sh) AFTER the issuer check.
# =============================================================================
set -euo pipefail

SUBSCRIPTION="de33857c-3d3d-483b-8c75-361b787f3a69"
RESOURCE_GROUP="DED_Project_STG"
AKS_NAME="aks-ded-stg-weu-01"
NAMESPACE="camunda"
CHART_VERSION="10.11.2"
VALUES_FILE="./camunda85-uat-values.yaml"
STORAGE_CLASS="managed-csi-premium"
INGRESS_NS="ingress-camunda"
INGRESS_CLASS="nginx-camunda"
APIM_HOST="apim-ded-stg-weu-01.azure-api.net"   # public host components advertise

g(){ printf '\033[0;32m[OK] %s\033[0m\n' "$1"; }
c(){ printf '\033[0;36m[..] %s\033[0m\n' "$1"; }
y(){ printf '\033[1;33m[!!] %s\033[0m\n' "$1"; }
hdr(){ printf '\n\033[1;35m==== %s ====\033[0m\n' "$1"; }

hdr "0. Tooling"
az account show >/dev/null 2>&1 || az login --use-device-code
az account set --subscription "$SUBSCRIPTION"
command -v kubectl >/dev/null 2>&1 || az aks install-cli
command -v helm >/dev/null 2>&1 || curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
command -v envsubst >/dev/null 2>&1 || { sudo apt-get update -y && sudo apt-get install -y gettext-base; }
g "tooling ready"

hdr "1. Connect to UAT private cluster"
az aks get-credentials -g "$RESOURCE_GROUP" -n "$AKS_NAME" --overwrite-existing
[[ "$(kubectl config current-context)" == "$AKS_NAME" ]] || { y "Wrong context!"; exit 1; }
kubectl get nodes
kubectl get storageclass | grep -q "$STORAGE_CLASS" || { y "StorageClass $STORAGE_CLASS not found"; exit 1; }
g "context=$AKS_NAME, storageclass ok"

hdr "2. Internal ingress (health-probe fix baked in)"
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx >/dev/null
helm repo update >/dev/null
helm upgrade --install ingress-nginx-camunda ingress-nginx/ingress-nginx \
  --namespace "$INGRESS_NS" --create-namespace \
  --set controller.ingressClassResource.name="$INGRESS_CLASS" \
  --set controller.ingressClassResource.controllerValue="k8s.io/ingress-nginx-camunda" \
  --set controller.ingressClass="$INGRESS_CLASS" \
  --set controller.electionID="camunda-ingress-leader" \
  --set controller.service.annotations."service\.beta\.kubernetes\.io/azure-load-balancer-internal"="true" \
  --set controller.service.annotations."service\.beta\.kubernetes\.io/azure-load-balancer-health-probe-request-path"="/healthz" \
  --set controller.service.annotations."service\.beta\.kubernetes\.io/azure-load-balancer-health-probe-protocol"="http"

c "Waiting for internal ingress IP..."
ING_IP=""
for i in $(seq 1 30); do
  ING_IP="$(kubectl get svc ingress-nginx-camunda-controller -n "$INGRESS_NS" \
            -o jsonpath='{.status.loadBalancer.ingress[0].ip}' 2>/dev/null || true)"
  [[ -n "$ING_IP" ]] && break; sleep 10
done
[[ -z "$ING_IP" ]] && { y "No internal IP. Check: kubectl get svc -n $INGRESS_NS"; exit 1; }
g "internal ingress IP: $ING_IP   (APIM serviceUrl -> http://$ING_IP/camunda)"

hdr "3. Install Camunda 8.5 (auth on)"
helm repo add camunda https://helm.camunda.io >/dev/null
helm repo update >/dev/null
export HOST="$APIM_HOST" SC="$STORAGE_CLASS"
RENDERED="/tmp/camunda85-uat.rendered.yaml"
envsubst < "$VALUES_FILE" > "$RENDERED"
c "rendered: HOST=$HOST SC=$SC"
kubectl create namespace "$NAMESPACE" --dry-run=client -o yaml | kubectl apply -f -
helm upgrade --install camunda camunda/camunda-platform \
  --version "$CHART_VERSION" --namespace "$NAMESPACE" \
  -f "$RENDERED" --timeout 20m
g "Camunda installed"

hdr "4. Verify pods"
kubectl get pods -n "$NAMESPACE"
echo
y "Wait until ALL pods are 1/1, then run the ISSUER CHECK below before APIM:"
cat <<EOF

  # 1) internal ingress serves the app (expect HTTP 302 -> keycloak):
  curl -sI -H "Host: $APIM_HOST" http://$ING_IP/camunda/operate/ | head -3

  # 2) Keycloak OIDC discovery shows the PUBLIC issuer (must be the APIM URL):
  kubectl run kctest --rm -it --restart=Never -n $NAMESPACE --image=curlimages/curl -- \\
    curl -s http://camunda-keycloak:80/camunda/auth/realms/camunda-platform/.well-known/openid-configuration \\
    | grep -o '"issuer":"[^"]*"'

  # EXPECT: "issuer":"https://$APIM_HOST/camunda/auth/realms/camunda-platform"
  # If it instead shows http://camunda-keycloak..., the KC_HOSTNAME_URL pin
  # didn't take -> tell me and we adjust before wiring APIM.

  echo "Record this for APIM:  INGRESS_IP = $ING_IP"
EOF
