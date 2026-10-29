# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "myTFResourceGroup-1"
  location = "westus2"
}

resource "azurerm_virtual_network" "vnet_1" {
  name                = "my-custom-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = "westus2"           # Must match your existing RG location
  resource_group_name = "myTFResourceGroup-1" # Name of your existing RG
}