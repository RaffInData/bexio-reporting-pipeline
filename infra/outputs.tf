output "resource_group_name" {
  description = "The name of the created Resource Group"
  value       = azurerm_resource_group.this.name
}

output "storage_account_name" {
  description = "The name of the created Storage Account"
  value       = azurerm_storage_account.this.name
}

output "function_app_name" {
  value = azurerm_function_app.this.name
}
