#!/usr/bin/env bash
set -euo pipefail

MYDIR=$(dirname $0)
TOPDIR=${MYDIR}/..

# This only works after 10-install-argocd.sh has installed the Argo "Application" CRD
kubectl apply -f ${TOPDIR}/argocd/application.yaml

echo "Application CR applied. Argo CD will reconcile shortly."
echo "Optional: open the UI via 'kubectl -n argocd port-forward svc/argocd-server 8080:80'"
echo "Optional: initial admin password:"
echo "kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' | base64 -d; echo"
