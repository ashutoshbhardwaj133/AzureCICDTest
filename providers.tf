terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.57.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.2.1"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.9.1"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = "true"
  features {}
}


terraform {
  backend "azurerm" {
    resource_group_name  = "rg-pes-arche-poc-sea-001"
    storage_account_name = "terraformbackendda"
    container_name       = "terraformbackend"
    key                  = "terraform.tfstate"


  }
}