# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  #equired_version = ">= 1.1.8"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "myTFResourceGroup"
  location = "germanywestcentral"
  tags = {
    Environment = "Terraform Getting Started"
    Team = "DevOps"
  }
  
}
# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "myTFVnet"
  address_space       = ["10.0.0.0/16"]
  location            = "germanywestcentral"
  resource_group_name = azurerm_resource_group.rg.name
}

