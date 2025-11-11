resource_group_name = "apanekrg001"
location            = "westeurope"

adls_name                = "apanekstg001"
account_tier             = "Standard"
account_replication_type = "LRS"
access_tier              = "Cold"

sa_vnet_name = "apanekvnet001"
address_space = ["10.0.0.0/20"]

subnet1_name = "subnet1"
address_prefixes = ["10.0.1.0/24"]