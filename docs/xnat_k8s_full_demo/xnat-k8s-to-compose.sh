#!/usr/bin/env bash
set -euo pipefail
REPO_DIR="${1:-./xnat-docker-compose}"
NAMESPACE="xnat-demo"
if [ ! -d "$REPO_DIR" ]; then
  echo "ERROR: repo dir not found: $REPO_DIR" >&2
  exit 1
fi
echo "1) Deleting Kubernetes resources..."
kubectl delete namespace "${NAMESPACE}" --ignore-not-found
echo
echo "2) Bringing Docker Compose stack back up..."
( cd "$REPO_DIR" && docker compose up --detach )
echo
echo "Docker Compose XNAT is back up."
