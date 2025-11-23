resource "azurerm_subnet" "sa_subnet" {
  name                 = var.sa_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.address_prefixes
  service_endpoints = var.service_endpoints
}