#!/usr/bin/env bash
# =============================================================================
# Camunda 8.5 -> aks-ded-dev-weu-01  (PRIVATE cluster)
# RUN THIS ON THE MGMT VM:  ssh azureuser@vm-mgmt-ded-dev-weu-01  (10.60.19.68)
# The private API server is only reachable from inside the VNet.
# Prereqs on the VM: az (logged in), kubectl. This script installs helm if missing.
# =============================================================================
set -euo pipefail

# ─── Fixed for this environment ───────────────────────────────────────────────
SUBSCRIPTION="de33857c-3d3d-483b-8c75-361b787f3a69"
RESOURCE_GROUP="DED_Project"
AKS_NAME="aks-ded-dev-weu-01"
NAMESPACE="camunda"
CHART_VERSION="10.11.2"                 # Camunda 8.5
VALUES_FILE="./camunda85-ded-dev-values.yaml"

# ─── Verify/adjust before running ─────────────────────────────────────────────
STORAGE_CLASS="managed-csi-premium"     # confirm against 'kubectl get storageclass'
INGRESS_NS="ingress-camunda"
INGRESS_CLASS="nginx-camunda"           # dedicated class, won't touch DED ingress

g(){ printf '\033[0;32m[OK] %s\033[0m\n' "$1"; }
c(){ printf '\033[0;36m[..] %s\033[0m\n' "$1"; }
y(){ printf '\033[1;33m[!!] %s\033[0m\n' "$1"; }
hdr(){ printf '\n\033[1;35m==== %s ====\033[0m\n' "$1"; }

# ─── 0. Tooling ───────────────────────────────────────────────────────────────
hdr "0. Tooling on mgmt VM"
az account show >/dev/null 2>&1 || az login --use-device-code
az account set --subscription "$SUBSCRIPTION"
command -v kubectl >/dev/null 2>&1 || az aks install-cli
if ! command -v helm >/dev/null 2>&1; then
  c "Installing helm..."
  curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
fi
command -v envsubst >/dev/null 2>&1 || { sudo apt-get update -y && sudo apt-get install -y gettext-base; }
g "az / kubectl / helm / envsubst ready"

# ─── 1. Kubeconfig for the PRIVATE cluster ────────────────────────────────────
hdr "1. Connect to private cluster"
az aks get-credentials -g "$RESOURCE_GROUP" -n "$AKS_NAME" --overwrite-existing
kubectl get nodes -o wide        # works only because we're inside the VNet
g "Connected to $AKS_NAME"

c "Storage classes available (set STORAGE_CLASS to match a real one):"
kubectl get storageclass
c "Existing ingress classes (we will ADD '$INGRESS_CLASS', not reuse these):"
kubectl get ingressclass 2>/dev/null || true

# ─── 2. Dedicated INTERNAL nginx ingress (private VNet IP) ────────────────────
hdr "2. Internal ingress controller ($INGRESS_CLASS)"
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx >/dev/null
helm repo update >/dev/null
helm upgrade --install ingress-nginx-camunda ingress-nginx/ingress-nginx \
  --namespace "$INGRESS_NS" --create-namespace \
  --set controller.ingressClassResource.name="$INGRESS_CLASS" \
  --set controller.ingressClassResource.controllerValue="k8s.io/ingress-nginx-camunda" \
  --set controller.ingressClass="$INGRESS_CLASS" \
  --set controller.electionID="camunda-ingress-leader" \
  --set controller.service.annotations."service\.beta\.kubernetes\.io/azure-load-balancer-internal"="true"

c "Waiting for INTERNAL ingress private IP..."
LB_IP=""
for i in $(seq 1 30); do
  LB_IP="$(kubectl get svc ingress-nginx-camunda-controller -n "$INGRESS_NS" \
            -o jsonpath='{.status.loadBalancer.ingress[0].ip}' 2>/dev/null || true)"
  [[ -n "$LB_IP" ]] && break
  sleep 10
done
[[ -z "$LB_IP" ]] && { y "No internal IP yet. Check: kubectl get svc -n $INGRESS_NS"; exit 1; }
HOST="${LB_IP}.nip.io"
g "Internal ingress IP: $LB_IP   HOST: $HOST"

# ─── 3. Render values + install Camunda 8.5 ───────────────────────────────────
hdr "3. Install Camunda 8.5"
helm repo add camunda https://helm.camunda.io >/dev/null
helm repo update >/dev/null

export HOST STORAGE_CLASS
RENDERED="/tmp/camunda85-ded-dev.rendered.yaml"
envsubst < "$VALUES_FILE" > "$RENDERED"
c "Rendered values: HOST=$HOST  STORAGE_CLASS=$STORAGE_CLASS"

kubectl create namespace "$NAMESPACE" --dry-run=client -o yaml | kubectl apply -f -

helm upgrade --install camunda camunda/camunda-platform \
  --version "$CHART_VERSION" \
  --namespace "$NAMESPACE" \
  -f "$RENDERED" \
  --timeout 20m
g "Camunda release installed in ns '$NAMESPACE'"

# ─── 4. Verify + access ───────────────────────────────────────────────────────
hdr "4. Verify"
kubectl get pods -n "$NAMESPACE"
ZEEBE_LB="$(kubectl get svc -n "$NAMESPACE" camunda-zeebe-gateway \
            -o jsonpath='{.status.loadBalancer.ingress[0].ip}' 2>/dev/null || true)"

hdr "ACCESS (from inside the VNet / mgmt VM)"
echo "  Operate  : http://${HOST}/operate"
echo "  Tasklist : http://${HOST}/tasklist"
echo "  Identity : http://${HOST}/identity"
echo "  Keycloak : http://${HOST}/auth/admin"
echo "  Zeebe gRPC (internal LB): ${ZEEBE_LB:-<pending>}:26500"
echo
echo "From your laptop, tunnel through the mgmt VM, e.g.:"
echo "  ssh -L 8088:${LB_IP}:80 azureuser@<mgmt-vm-public-or-bastion>"
echo "  then browse http://${HOST}:8088/operate  (Host header still resolves via nip.io)"
echo
echo "Login creds (auto-generated secret):"
echo "  kubectl get secret -n $NAMESPACE camunda-credentials -o yaml"
g "Persistence on $STORAGE_CLASS managed disks - survives pod/node restarts."
