sudo minikube delete
sudo minikube start --vm-driver=none --addons=registry --kubernetes-version=v1.23.0
sudo mv /home/diyuser3/.kube /home/diyuser3/.minikube $HOME
sudo chown -R $USER $HOME/.kube $HOME/.minikube

