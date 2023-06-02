terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.56.0"
    }
    postgresql = {
      source                = "cyrilgdn/postgresql"
      version               = ">= 1.19.0"
    }
  }
}

provider "azurerm" {
  features {}
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
}

provider "postgresql" {
  alias           = "gimlet-terraform-poc-server"
  host            = var.host
  port            = 5432
  sslmode         = "require"
  connect_timeout = 120
  superuser       = false
  username        = var.username
  password        = var.password
}
