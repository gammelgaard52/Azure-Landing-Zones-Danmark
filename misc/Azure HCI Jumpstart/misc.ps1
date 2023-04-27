az --version
az login
az account show
az account list --query "[?isDefault]"
az vm list-usage --location northeurope --output table
az provider register --namespace Microsoft.HybridCompute --wait
az provider register --namespace Microsoft.GuestConfiguration --wait
az provider register --namespace Microsoft.Kubernetes --wait
az provider register --namespace Microsoft.KubernetesConfiguration --wait
az provider register --namespace Microsoft.ExtendedLocation --wait
az provider register --namespace Microsoft.AzureArcData --wait
az provider register --namespace Microsoft.OperationsManagement --wait
az provider register --namespace Microsoft.AzureStackHCI --wait
az provider register --namespace Microsoft.ResourceConnector --wait

$subscriptionId=$(az account show --query id --output tsv)
az ad sp create-for-rbac -n "JumpstartHCIBox" --role "Owner" --scopes /subscriptions/$subscriptionId
{
    "appId": "b002aadd-ef81-40ce-9cf4-813313a3191c",
    "displayName": "JumpstartHCIBox",
    "password": "yjh8Q~JZ8z6a.D_XAKdYWnYakNWba8H9Id.R9ayG",
    "tenant": "97e7fa82-8ca6-4a93-a6c8-96ae01b69d29"
  }

git clone https://github.com/microsoft/azure_arc.git
az bicep upgrade
az group create --name "rg-hcijumpbox"  --location "northeurope"
az deployment group create -g "rg-hcijumpbox" -f "main.bicep" -p "main.parameters.json"