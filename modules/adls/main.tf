resource "azurerm_storage_account" "devstorageacc001" {
  name                     = var.name
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

resource "azurerm_storage_account_static_website" "static_website" {
  storage_account_id = azurerm_storage_account.devstorageacc001.id
  index_document     = var.static_website_index_document
  error_404_document = var.static_website_error_404_document
}