#!/bin/bash

echo "We need the AZ CLI login to be performed before starting."
echo "Are you logged into the Azure Tenant you want to use? (y/n)"
read answer

if [[ $answer =~ ^[Yy]$ ]]
then
    echo "Proceeding with the operation."
    echo "Please input your first and last name (e.g. josemaia), which will be used to name the resources in Azure:"
    read name
    az group create --name "$name-terraform-tutorial" --location westeurope
    az storage account create --name "$name"terraformstate --resource-group "$name-terraform-tutorial" --location westeurope --sku Standard_LRS
    az storage container create --name terraform-state --account-name "$name"terraformstate
    ACCOUNT_KEY=$(az storage account keys list --resource-group "$name-terraform-tutorial" --account-name "$name"terraformstate --query '[0].value' -o tsv)
    echo "Your storage account key is $ACCOUNT_KEY. Set it to env var ARM_ACCESS_KEY before running the next step."
    echo "Resource group and storage account created. You can move on to step 1."
    exit 0
else
    echo "Operation cancelled."
    exit 1
fi