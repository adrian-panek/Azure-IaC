resource "azurerm_resource_group" "adls_rg" {
    name     = var.name
    location = var.location
}
