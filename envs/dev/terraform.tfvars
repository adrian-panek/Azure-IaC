resource_group_name = "apanekrg001"
location            = "westeurope"

adls_name                = "apanekstg001"
account_tier             = "Standard"
account_replication_type = "LRS"
access_tier              = "Cold"

sa_vnet_name  = "apanekvnet001"
address_space = ["10.0.0.0/20"]

sa_subnet_name   = "subnet1"
address_prefixes = ["10.0.1.0/24"]

service_endpoints = ["Microsoft.Storage"]

profile_name        = "fd-about-me"
sku_name            = "Standard_AzureFrontDoor"
endpoint_name       = "fd-endpoint"
origin_name         = "storage-origin-group"
route_name          = "static-route"
storage_origin_name = "static-web-origin"