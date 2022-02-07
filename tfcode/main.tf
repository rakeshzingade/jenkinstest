terraform {
      backend "azurerm" {}
}

# Provider Block

provider "azurerm" {
    client_id       =   var.client_id
    client_secret   =   var.client_secret
    subscription_id =   var.subscription_id
    tenant_id       =   var.tenant_id
    
    features {}
}

resource "azurerm_resource_group" "icm_rg" {
  name     = var.rgname
  location = var.location
}

