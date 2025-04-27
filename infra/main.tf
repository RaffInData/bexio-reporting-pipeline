resource "random_integer" "suffix" {
  min = 10000
  max = 99999
}

resource "azurerm_resource_group" "this" {
  name     = "bexio-rg"
  location = "West Europe"
}

resource "azurerm_storage_account" "this" {
  name                     = "bexiostorage${random_integer.suffix.result}"
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}