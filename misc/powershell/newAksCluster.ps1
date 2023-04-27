# Se log her: https://tdc.sharepoint.com/:w:/r/sites/AzureCompliantandconfidentialcompute-ConfidentialCompute/Delte%20dokumenter/Confidential%20Compute/AKS%20cluster/log.docx?d=wc959e1be78544ec08957f82064066047&csf=1&web=1&e=jrly83

az --version
az upgrade
az login
az account show
az account list --query "[?isDefault]"

az group create --name rg-cc-aks --location westeurope
az aks create -g rg-cc-aks --name myAKSCluster --generate-ssh-keys --enable-addons confcom --enable-sgxquotehelper
az aks nodepool add --cluster-name myAKSCluster --name confcompool1 --resource-group rg-cc-aks --node-vm-size Standard_DC4s_v3 --node-count 2

az aks get-credentials --resource-group rg-cc-aks --name myAKSCluster
kubectl get pods --all-namespaces


az group create --name rg-cc-aks-default --location westeurope
az aks create -g rg-cc-aks-default --name myAKSClusterDefault --generate-ssh-keys --enable-addons confcom
az aks nodepool add --cluster-name myAKSClusterDefault --name confcompool1 --resource-group rg-cc-aks-default --node-vm-size Standard_DC4s_v3 --node-count 2

az aks get-credentials --resource-group rg-cc-aks-default --name myAKSClusterDefault
kubectl get pods --all-namespaces

az aks disable-addons -a confcom -n myAKSClusterDefault -g rg-cc-aks-default
kubectl get pods --all-namespaces
az aks enable-addons --addons confcom --name myAKSClusterDefault --resource-group rg-cc-aks-default --enable-sgxquotehelper
kubectl get pods --all-namespaces

az aks nodepool delete --cluster-name myAKSClusterDefault --name confcompool1 --resource-group rg-cc-aks-default
az aks delete --resource-group rg-cc-aks-default --name myAKSClusterDefault

kubectl get jobs -l app=sgx-test
kubectl get pods -l app=sgx-test
kubectl logs -l app=sgx-test

az aks nodepool list --resource-group rg-cc-aks --cluster-name myAKSCluster
# confcompool1
# nodepool1

kubectl get jobs -l app=sgx-test2
kubectl get pods -l app=sgx-test2
kubectl logs -l app=sgx-test2

kubectl get jobs -l app=sgx-test3
kubectl get pods -l app=sgx-test3
kubectl logs -l app=sgx-test3