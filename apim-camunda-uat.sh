#!/usr/bin/env bash
# =============================================================================
# APIM wiring: expose Camunda 8.5 (UAT) at
#   https://apim-ded-stg-weu-01.azure-api.net/camunda/*
# Backend: internal nginx-camunda ingress at http://10.62.0.34/camunda
# Keyless (matches all other DED APIs). Run on vm-mgmt-ded-stg-weu-01.
# =============================================================================
set -euo pipefail

SUBSCRIPTION="de33857c-3d3d-483b-8c75-361b787f3a69"
RG="DED_Project_STG"
APIM="apim-ded-stg-weu-01"
APIM_HOST="apim-ded-stg-weu-01.azure-api.net"
API_ID="ded-camunda"
API_PATH="camunda"
INGRESS_IP="10.62.0.34"                       # from the deploy step
SERVICE_URL="http://${INGRESS_IP}/camunda"    # /camunda preserved to backend

az account set --subscription "$SUBSCRIPTION"

echo "==== 1. Create keyless Camunda API ===="
az apim api create -g "$RG" -n "$APIM" \
  --api-id "$API_ID" \
  --display-name "Camunda" \
  --path "$API_PATH" \
  --service-url "$SERVICE_URL" \
  --protocols https \
  --subscription-required false

echo "==== 2. All-method wildcard operations ===="
for M in GET POST PUT DELETE PATCH OPTIONS HEAD; do
  az apim api operation create -g "$RG" -n "$APIM" \
    --api-id "$API_ID" \
    --operation-id "wildcard-${M,,}" \
    --display-name "wildcard-${M}" \
    --method "$M" \
    --url-template "/*" 1>/dev/null
  echo "  + $M /*"
done

echo "==== 3. Inbound policy (Host + X-Forwarded headers) ===="
POLICY_FILE="/tmp/camunda-apim-policy.xml"
cat > "$POLICY_FILE" <<XML
<policies>
  <inbound>
    <base />
    <set-backend-service base-url="${SERVICE_URL}" />
    <set-header name="Host" exists-action="override">
      <value>${APIM_HOST}</value>
    </set-header>
    <set-header name="X-Forwarded-Proto" exists-action="override">
      <value>https</value>
    </set-header>
    <set-header name="X-Forwarded-Host" exists-action="override">
      <value>${APIM_HOST}</value>
    </set-header>
  </inbound>
  <backend><base /></backend>
  <outbound><base /></outbound>
  <on-error><base /></on-error>
</policies>
XML

# CLI has no direct api-policy set; use az rest against the management API.
APIM_RID="$(az apim show -g "$RG" -n "$APIM" --query id -o tsv)"
az rest --method put \
  --url "https://management.azure.com${APIM_RID}/apis/${API_ID}/policies/policy?api-version=2022-08-01" \
  --headers "Content-Type=application/json" \
  --body "$(jq -n --arg xml "$(cat "$POLICY_FILE")" \
            '{properties:{format:"xml", value:$xml}}')"

echo
echo "==== DONE ===="
echo "Test from your laptop browser:"
echo "  https://${APIM_HOST}/camunda/operate"
echo "Login redirects to Keycloak at /camunda/auth (admin / keycloak admin-password)."
