resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    project     = "bexio-reporting"
    environment = "dev"
  }
}

resource "azurerm_storage_account" "this" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    project     = "bexio-reporting"
    environment = "dev"
  }
}

resource "azurerm_app_service_plan" "this" {
  name                = "bexio-plan"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  kind                = "FunctionApp"
  reserved            = true

  sku {
    tier = "Dynamic"
    size = "Y1"
  }

  tags = {
    project     = "bexio-reporting"
    environment = "dev"
  }
}

resource "azurerm_function_app" "this" {
  name                       = "bexio-function-app"
  location                   = azurerm_resource_group.this.location
  resource_group_name        = azurerm_resource_group.this.name
  app_service_plan_id        = azurerm_app_service_plan.this.id
  storage_account_name       = azurerm_storage_account.this.name
  storage_account_access_key = azurerm_storage_account.this.primary_access_key
  version                    = "~4"

  tags = {
    project     = "bexio-reporting"
    environment = "dev"
  }
}
