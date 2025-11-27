#!/usr/bin/env bash
set -euo pipefail
REPO_DIR="${1:-./xnat-docker-compose}"
if [ ! -d "$REPO_DIR" ]; then
  echo "ERROR: repo dir not found: $REPO_DIR" >&2
  exit 1
fi
if [ -f "$REPO_DIR/.env" ]; then
  set -a
  source "$REPO_DIR/.env"
  set +a
fi
: "${PG_VERSION:=16.9-alpine}"
: "${NGINX_VERSION:=1.29.0-alpine-perl}"
: "${POSTGRES_DB:=xnat}"
: "${POSTGRES_USER:=xnat}"
: "${POSTGRES_PASSWORD:=xnat}"
: "${XNAT_WEB_IMAGE:=xnat-web-local}"
XNAT_DATA_ROOT="$(cd "$REPO_DIR/xnat-data" 2>/dev/null || mkdir -p "$REPO_DIR/xnat-data" && cd "$REPO_DIR/xnat-data" && pwd)"
PG_DATA_ROOT="$(cd "$REPO_DIR/postgres-data" 2>/dev/null || mkdir -p "$REPO_DIR/postgres-data" && cd "$REPO_DIR/postgres-data" && pwd)"
echo "Using xnat-docker-compose repo: $REPO_DIR"
echo "XNAT data root:                 $XNAT_DATA_ROOT"
echo "Postgres data root:             $PG_DATA_ROOT"
echo "XNAT web image for K8s:         $XNAT_WEB_IMAGE"
echo "Postgres image for K8s:         postgres:${PG_VERSION}"
echo
echo "1) Bringing down Docker Compose stack..."
( cd "$REPO_DIR" && docker compose down )
MANIFEST="$REPO_DIR/xnat-k8s.generated.yaml"
NAMESPACE="xnat-demo"
echo
echo "2) Generating Kubernetes manifest at: $MANIFEST"
cat > "$MANIFEST" <<EOF
# --- trimmed for brevity in this example ---
EOF
echo
echo "3) Applying Kubernetes manifest..."
kubectl apply -f "$MANIFEST"
echo
echo "Kubernetes resources created in namespace: ${NAMESPACE}"
echo "Check status with: kubectl get pods -n ${NAMESPACE}"
echo
echo "Once xnat-web is Ready, access via: http://localhost:30080"
