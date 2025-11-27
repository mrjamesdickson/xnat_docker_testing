#!/usr/bin/env bash
#
# k8s_demo_failover_xnat.sh
#
# Live demo harness for XNAT on Kubernetes with:
#   - Webapp failover: multiple xnat-web pods behind a Service/Ingress
#   - DB failover: HA Postgres (e.g. CloudNativePG) promoting a new primary
#
# It assumes:
#   - Namespace: xnat-demo
#   - XNAT Deployment: xnat-web (label app=xnat-web)
#   - XNAT Ingress/Service already expose the app externally
#   - HA Postgres Cluster: xnat-db (CloudNativePG), with read-write Service xnat-db-rw
#
# You provide the *external* front-end URL via FRONTEND_URL, e.g.:
#   FRONTEND_URL=http://xnat.local/ ./k8s_demo_failover_xnat.sh
#
# What it does:
#   1) Ensures at least 2 xnat-web replicas
#   2) Waits for HTTP 200/302 from the front-end
#   3) Starts a loop printing HTTP status codes every 2 seconds
#   4) Deletes one xnat-web pod (webapp failover)
#   5) Deletes the DB primary pod (DB failover)
#   6) Keeps printing status codes so you can show continuity in the browser
#

set -euo pipefail

NAMESPACE="${NAMESPACE:-xnat-demo}"
XNAT_DEPLOYMENT="${XNAT_DEPLOYMENT:-xnat-web}"
FRONTEND_URL="${FRONTEND_URL:-http://xnat.local/}"

# CloudNativePG cluster name (used to locate DB pods)
DB_CLUSTER_NAME="${DB_CLUSTER_NAME:-xnat-db}"

# HTTP status codes we'll treat as "up"
OK_CODES_REGEX="${OK_CODES_REGEX:-200|302}"

function log() {
  echo "[$(date +'%Y-%m-%dT%H:%M:%S')] $*"
}

function wait_for_http() {
  local url="$1"
  local timeout="${2:-600}"
  local start
  start=$(date +%s)
  while true; do
    local code
    code=$(curl -s -o /dev/null -w "%{http_code}" "${url}" || echo "000")
    if echo "${code}" | grep -Eq "${OK_CODES_REGEX}"; then
      log "HTTP ready at ${url} (status=${code})"
      return 0
    fi
    local now
    now=$(date +%s)
    if (( now - start > timeout )); then
      log "ERROR: timeout waiting for HTTP ready at ${url}"
      return 1
    fi
    sleep 5
  done
}

function http_loop() {
  local url="$1"
  log "Starting HTTP loop against ${url} (Ctrl+C to stop the script)..."
  while true; do
    local code
    code=$(curl -s -o /dev/null -w "%{http_code}" "${url}" || echo "000")
    echo "$(date +'%H:%M:%S') HTTP ${code}"
    sleep 2
  done
}

function ensure_replicas() {
  local deploy="$1"
  local ns="$2"
  local desired="${3:-2}"
  log "Ensuring deployment/${deploy} in namespace ${ns} has at least ${desired} replicas..."
  kubectl scale deployment "${deploy}" -n "${ns}" --replicas="${desired}" >/dev/null
  log "Waiting for ${desired} ready replicas..."
  kubectl rollout status deployment "${deploy}" -n "${ns}" --timeout=600s
}

function pick_web_pod() {
  local ns="$1"
  kubectl get pods -n "${ns}" -l app=xnat-web -o jsonpath='{.items[0].metadata.name}'
}

function pick_db_primary_pod() {
  local ns="$1"
  local cluster="$2"
  # CloudNativePG labels pods with cnpg.io/cluster=<name> and cnpg.io/instanceRole=primary|replica
  kubectl get pods -n "${ns}" -l "cnpg.io/cluster=${cluster}" -o jsonpath='{range .items[*]}{.metadata.name}{" "}{.metadata.labels.cnpg\.io/instanceRole}{"
"}{end}' | awk '$2=="primary"{print $1; exit}'
}

log "=== XNAT K8s web + DB failover demo ==="
log "Namespace: ${NAMESPACE}"
log "XNAT Deployment: ${XNAT_DEPLOYMENT}"
log "Front-end URL: ${FRONTEND_URL}"
log "DB cluster (CloudNativePG): ${DB_CLUSTER_NAME}"

log "Step 0: Ensure at least 2 xnat-web replicas..."
ensure_replicas "${XNAT_DEPLOYMENT}" "${NAMESPACE}" 2

log "Step 1: Wait for front-end HTTP to be ready..."
wait_for_http "${FRONTEND_URL}" 900

log "Step 2: Start background HTTP status loop..."
http_loop "${FRONTEND_URL}" &
HTTP_LOOP_PID=$!

sleep 5

log ""
log "=== STEP 3: Webapp failover demo ==="
WEB_POD_TO_KILL=$(pick_web_pod "${NAMESPACE}")
log "Deleting one web pod: ${WEB_POD_TO_KILL}"
kubectl delete pod "${WEB_POD_TO_KILL}" -n "${NAMESPACE}" --wait=false

log "Waiting for deployment to self-heal..."
kubectl rollout status deployment "${XNAT_DEPLOYMENT}" -n "${NAMESPACE}" --timeout=600s || true

log "You should see HTTP codes continue (maybe brief blip) while a new web pod spins up."
sleep 15

log ""
log "=== STEP 4: DB failover demo ==="
DB_PRIMARY_POD=$(pick_db_primary_pod "${NAMESPACE}" "${DB_CLUSTER_NAME}" || true)
if [[ -z "${DB_PRIMARY_POD}" ]]; then
  log "WARNING: could not auto-detect DB primary pod. Adjust DB_CLUSTER_NAME or label logic."
else
  log "Deleting DB primary pod: ${DB_PRIMARY_POD}"
  kubectl delete pod "${DB_PRIMARY_POD}" -n "${NAMESPACE}" --wait=false
fi

log "CloudNativePG should now promote a replica and update the RW Service."
log "Keep an eye on HTTP codes and your browser; you may see a momentary error, then recovery."

# Let the loop run; user can Ctrl+C when done
wait "${HTTP_LOOP_PID}"
