variable "adls_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "account_tier" {
  type    = string
  default = "Standard"
}

variable "account_replication_type" {
  type    = string
  default = "LRS"
}

variable "access_tier" {
  type = string
}

variable "default_action" {
  type    = string
  default = "Deny"
}

variable "subnet_ids" {
  type = list(string)
}

variable "ip_rules" {
  type = list(string)
}