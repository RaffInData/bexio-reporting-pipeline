variable "resource_group_name" {
  description = "The name of the Azure Resource Group"
  type        = string
  default     = "bexio-rg"
}

variable "storage_account_name" {
  description = "The name of the Azure Storage Account"
  type        = string
  default     = "bexiostorage67073"
}

variable "location" {
  description = "The Azure Region where resources are deployed"
  type        = string
  default     = "westeurope"
}
