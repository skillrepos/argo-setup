echo
echo ...Getting rid of existing instances
echo
kubectl delete ns argocd
pkill kubectl
echo
echo ...Installing argocd
echo
# install argocd
# ref: https://argo-cd.readthedocs.io/en/stable/getting_started/
kubectl create ns argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
sudo curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo chmod +x /usr/local/bin/argocd
echo
echo ...Waiting for pods to be ready
echo
kubectl wait --for=condition=Ready pod --all -n argocd
echo
echo ...Getting initial ArgoCD password
echo
# dump out the initial argocd password
echo
echo ArgoCD password follows:
echo
echo !!!!!!!!!!!!!
echo
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
echo
echo !!!!!!!!!!!!!
