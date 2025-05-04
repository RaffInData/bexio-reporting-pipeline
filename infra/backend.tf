terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "bexiotfstate2025"
    container_name       = "tfstate"
    key                  = "bexio-reporting.terraform.tfstate"
  }
}
