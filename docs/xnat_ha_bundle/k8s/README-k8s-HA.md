# Kubernetes: XNAT with HA PostgreSQL (CloudNativePG)

This directory contains example manifests for:

- A CloudNativePG `Cluster` providing HA Postgres for XNAT
- Credentials `Secret` for the XNAT DB user
- XNAT `Deployment` and `Service`
- An `Ingress` for HTTP access

## 1. Prerequisites

- Kubernetes cluster
- CloudNativePG operator installed
- An ingress controller (e.g., nginx ingress)

## 2. Apply manifests

```bash
kubectl create namespace xnat-demo
kubectl apply -n xnat-demo -f xnat-db-credentials-secret.yaml
kubectl apply -n xnat-demo -f cloudnativepg-cluster.yaml
kubectl apply -n xnat-demo -f xnat-web-deployment.yaml
kubectl apply -n xnat-demo -f xnat-ingress.yaml
```

Then access XNAT via the host configured in `xnat-ingress.yaml`
(e.g., `http://xnat.local/`, with appropriate /etc/hosts entry if needed).
