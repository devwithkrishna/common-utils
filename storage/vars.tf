
variable "resource_group_name" {
  type        = string
  description = "Azure Storage Account Rg"
  default     = "TF-TEST"
}

variable "location" {
  type        = string
  description = "Azure storage account location"
  default     = "centralindia"
}

variable "storage_account_name" {
  description = "Azure Storage Account name"
  type        = string
  default     = "tftes809654"

}

variable "account_tier" {
  default     = "Standard"
  description = "Tier to use for this storage account. Valid options are Standard and Premium"
}

variable "account_kind" {
  default     = "StorageV2"
  description = "Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2"
}

variable "account_replication_type" {
  description = "type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS"
  default     = "LRS"
}

variable "cross_tenant_replication_enabled" {
  default     = true
  description = "Should cross Tenant replication be enabled"
}

variable "public_network_access_enabled" {
  default     = true
  description = "Whether the public network access is enabled"
}

variable "delete_retention_policy" {
  default     = 5
  description = "Specifies the number of days that the blob should be retained"
}

variable "environment" {
  default     = "DEV"
  description = "Environment tag value in Azure"
}

variable "application_name" {
  default     = "devwithkrishna"
  description = "Azure application name tag"
}
