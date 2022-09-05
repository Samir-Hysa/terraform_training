terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = "westeurope"
}

resource "azurerm_virtual_network" "vnet" {
  name = "TFvnet"
  address_space = ["10.0.0.0/16"]
  location = "westeurope"
  tags = {
    By = "Terraform"
  }
  resource_group_name = azurerm_resource_group.rg.name
}
