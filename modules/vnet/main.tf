resource "azurerm_virtual_network" "sa_vnet" {
    name = var.name
    resource_group_name = var.resource_group_name
    address_space = var.address_space
    location = var.location
}