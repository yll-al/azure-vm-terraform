terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "yll-devops"
    storage_account_name = "tfstateyll"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
