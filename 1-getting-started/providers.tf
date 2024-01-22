terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  backend "azurerm" {
    resource_group_name  = "$name-terraform-tutorial"
    storage_account_name = "$nameterraformstate"
    container_name       = "terraform-state"
    key                  = "azure-tutorial.tfstate"
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}
