terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstate16584"
    container_name       = "tfstatefiles"
    key                  = "dev.terraform.tfstate"
  }
}