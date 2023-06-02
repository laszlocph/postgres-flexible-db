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

resource "random_password" "password" {
  length           = 24
  special          = false
}

resource "azurerm_postgresql_flexible_server_database" "gimlet-azure-poc-db" {
  name      = var.database
  server_id = var.server_id
  collation = "en_US.utf8"
  charset   = "utf8"
}

resource "postgresql_role" "app_user" {
  name     = var.user
  login    = true
  password = random_password.password.result
}

resource "postgresql_grant" "read_from_emp" {
  database    = azurerm_postgresql_flexible_server_database.gimlet-azure-poc-db.name
  role        = postgresql_role.app_user.name
  schema      = "public"
  object_type = "schema"
  privileges  = []
}
