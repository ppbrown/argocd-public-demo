#!/usr/bin/env bash
set -euo pipefail

NS=argocd
kubectl get ns "$NS" >/dev/null 2>&1 || kubectl create ns "$NS"

# Official multi-tenant install manifest
kubectl apply -n "$NS" -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# These DO nothing. They just give pretty output while you wait for install to complete
kubectl -n "$NS" rollout status deploy/argocd-server --timeout=180s
kubectl -n "$NS" rollout status deploy/argocd-repo-server --timeout=180s
kubectl -n "$NS" rollout status deploy/argocd-applicationset-controller --timeout=180s
