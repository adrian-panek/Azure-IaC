resource "azurerm_storage_account" "devstorageacc001" {
  name                     = var.adls_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  access_tier              = var.access_tier


  network_rules {
    default_action             = var.default_action
    virtual_network_subnet_ids = var.subnet_ids
    ip_rules                   = var.ip_rules
  }
}