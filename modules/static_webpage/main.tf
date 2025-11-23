resource "azurerm_storage_container" "web" {
  name                  = var.storage_container_name
  storage_account_id    = var.storage_account_id
  container_access_type = "blob"
}

resource "azurerm_storage_blob" "about_me" {
  name                   = var.name
  storage_account_name   = var.storage_account_name
  storage_container_name = azurerm_storage_container.web.name
  type                   = var.type
  content_type           = var.content_type
  source                 = "${path.module}/${var.content_source}"
}