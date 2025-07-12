terraform {
  backend "azurerm" {
    resource_group_name  = "ARCHITECTS-STORAGE-RG" # Replace with your resource group name
    storage_account_name = "techarchitectssa"      # Replace with your storage account name
    container_name       = "tfstatefiles"          # Replace with your container name
    key                  = "tftest7809654.tfstate" # This is the name of the state file
  }
}
