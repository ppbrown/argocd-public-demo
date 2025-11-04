#!/usr/bin/env bash
set -euo pipefail

NS=argocd
kubectl get ns "$NS" >/dev/null 2>&1 || kubectl create ns "$NS"

# Official multi-tenant install manifest
kubectl apply -n "$NS" -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Wait for the API/UI to be up (not strictly required to sync apps, but nice)
kubectl -n "$NS" rollout status deploy/argocd-server --timeout=180s
kubectl -n "$NS" rollout status deploy/argocd-repo-server --timeout=180s
kubectl -n "$NS" rollout status deploy/argocd-application-controller --timeout=180s
