pkill kubectl
echo ...Setting up port forwarding
echo
kubectl port-forward -n argocd svc/argocd-server 9090:443 2>&1 >/dev/null &
echo

