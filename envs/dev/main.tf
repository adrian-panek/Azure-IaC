data "http" "deployer_ip" {
  url = "https://api.ipify.org?format=json"
  
  request_headers = {
    Accept = "application/json"
  }
}

locals {
  deployer_public_ip = jsondecode(data.http.deployer_ip.response_body).ip
  ip_rules = [format("%s/30", local.deployer_public_ip)]

}

module "rg" {
  source   = "../../modules/rg"
  name     = var.resource_group_name
  location = var.location
}

module "adls" {
  source                   = "../../modules/adls"
  name                     = var.adls_name
  resource_group_name      = module.rg.name
  location                 = module.rg.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  access_tier              = var.access_tier
  subnet_ids               = [module.subnet.id]
  ip_rules                 = local.ip_rules
}

module "sa_vnet" {
  source              = "../../modules/vnet"
  name                = var.sa_vnet_name
  resource_group_name = module.rg.name
  location            = module.rg.location
  address_space       = var.address_space
}

module "subnet" {
  source               = "../../modules/subnet"
  name                 = var.subnet1_name
  address_prefixes     = var.address_prefixes
  resource_group_name  = module.rg.name
  virtual_network_name = module.sa_vnet.sa_vnet_name
  service_endpoints    = var.service_endpoints
}

module "action_group" {
  source              = "../../modules/action_group"
  resource_group_name = module.rg.name
  email_receivers     = var.emails
  action_group_name   = "budget-alerts"
}

module "alert" {
  source              = "../../modules/alert"
  subscription_id     = var.subscription_id
  name                = "monthly-budget"
  action_group_ids    = [module.action_group.action_group_id]
  notification_emails = var.emails
}
