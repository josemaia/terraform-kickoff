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
    az storage account create --name "$name-terraform-state" --resource-group "$name-terraform-tutorial" --location westeurope --sku Standard_LRS
    echo "Resource group and storage account created. You can move on to step 1."
    exit 0
else
    echo "Operation cancelled."
    exit 1
fi