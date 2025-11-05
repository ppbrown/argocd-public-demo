#!/usr/bin/env bash


echo RUN THIS AT YOUR OWN RISK
echo ""
echo Current k8s context is 
echo ""
echo "       $(kubectl config current-context)"
echo ""


echo "The commands to remove ArgoCD and the demo app are as follows:"

cat <<EOF

kubectl delete -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl delete ns argocd

kubectl delete -n demo-app deploy/demo-app
kubectl delete -n demo-app service/demo-app
kubectl delete ns demo-app
EOF
