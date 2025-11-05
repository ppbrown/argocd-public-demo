kubectl create ns argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# These DO nothing. They just give pretty output while you wait for install to complete
kubectl -n "$NS" rollout status deploy/argocd-server --timeout=180s
kubectl -n "$NS" rollout status deploy/argocd-repo-server --timeout=180s
kubectl -n "$NS" rollout status deploy/argocd-applicationset-controller --timeout=180s
