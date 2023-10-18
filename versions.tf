terraform {
  required_version = ">=0.12"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
      
    }
  }

  backend "azurerm" {
    resource_group_name  = "ananth-group"
    storage_account_name = "terraformstateananth"
    container_name       = "terraform-global-state"
    key                  = "terraform.tfstate"
  }
}