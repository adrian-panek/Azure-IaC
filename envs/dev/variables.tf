variable "resource_group_name" {
  type = string
}

variable "adls_name" {
  type = string
}

variable "location" {
  type    = string
  default = null
}

variable "account_tier" {
  type = string
}

variable "account_replication_type" {
  type = string
}

variable "access_tier" {
  type = string
}

variable "subscription_id" {
  type      = string
  sensitive = true
}

variable "emails" {
  type    = list(string)
  default = []
}

variable "sa_vnet_name" {
  type = string
}

variable "address_space" {
  type = list(string)
}

variable "sa_subnet_name" {
  type = string
}

variable "address_prefixes" {
  type = list(string)
}

variable "service_endpoints" {
  type = list(string)
}

variable "content_source" {
  type    = string
  default = null
}

variable "monthly_budget_name" {
  type    = string
  default = "monthly-budget"
}

variable "action_group_name" {
  type    = string
  default = "budget-alerts"
}