variable "action_group_name" {
  type    = string
  default = "budget-alerts"
}

variable "resource_group_name" {
  type = string
}

variable "email_receivers" {
  type      = list(string)
  sensitive = true
  default   = []
}