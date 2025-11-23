variable "subscription_id" {
  type      = string
  sensitive = true
}

variable "monthly_budget_name" {
  type    = string
  default = "monthly-budget"
}

variable "budget_amount" {
  type    = number
  default = 1
}

variable "action_group_ids" {
  type    = list(string)
  default = []
}

variable "notification_emails" {
  type    = list(string)
  default = []
}

variable "budget_threshold" {
  type    = number
  default = 50
}