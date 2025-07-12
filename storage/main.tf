
module "storage-account" {
  source                           = "git::https://github.com/devwithkrishna/azure-terraform-modules.git//storage-account?ref=feature/user-assigned-managed-identity"
  resource_group_name              = var.resource_group_name
  location                         = var.location
  storage_account_name             = var.storage_account_name
  account_tier                     = var.account_tier
  account_kind                     = var.account_kind
  account_replication_type         = var.account_replication_type
  cross_tenant_replication_enabled = var.cross_tenant_replication_enabled
  public_network_access_enabled    = var.public_network_access_enabled
  delete_retention_policy          = var.delete_retention_policy
  environment                      = var.environment
  application_name                 = var.application_name
  temporary                        = "trUe"
}
