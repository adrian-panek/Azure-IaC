data "http" "deployer_ip" {
  url = "https://api.ipify.org?format=json"

  request_headers = {
    Accept = "application/json"
  }
}

locals {
  deployer_public_ip = jsondecode(data.http.deployer_ip.response_body).ip
  ip_rules           = concat([format("%s/30", local.deployer_public_ip)], ["0.0.0.0/0"])

  default_location = "westeurope"

  static_website_defaults = {
    index_document = "index.html"
    error_document = "index.html"
  }

  storage_defaults = {
    container_name = "$web"
    blob_type      = "Block"
    content_type   = "text/html"
  }

  location = var.location != null ? var.location : local.default_location
}

module "rg" {
  source   = "../../modules/rg"
  name     = var.resource_group_name
  location = local.location
}

module "adls" {
  source                            = "../../modules/adls"
  name                              = var.adls_name
  resource_group_name               = module.rg.name
  location                          = module.rg.location
  account_tier                      = var.account_tier
  account_replication_type          = var.account_replication_type
  access_tier                       = var.access_tier
  subnet_ids                        = [module.subnet.id]
  ip_rules                          = local.ip_rules
  static_website_index_document     = local.static_website_defaults.index_document
  static_website_error_404_document = local.static_website_defaults.error_document
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
  action_group_name   = var.action_group_name
}

module "alert" {
  source              = "../../modules/alert"
  subscription_id     = var.subscription_id
  monthly_budget_name = var.monthly_budget_name
  action_group_ids    = [module.action_group.action_group_id]
  notification_emails = var.emails
}

module "webpage" {
  source                 = "../../modules/static_webpage"
  storage_account_name   = module.adls.name
  storage_account_id     = module.adls.id
  name                   = local.static_website_defaults.index_document
  storage_container_name = local.storage_defaults.container_name
  type                   = local.storage_defaults.blob_type
  content_type           = local.storage_defaults.content_type
  content_source         = local.static_website_defaults.index_document
}
