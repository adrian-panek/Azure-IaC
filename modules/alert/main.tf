resource "azurerm_consumption_budget_subscription" "spending_alert" {
  name            = var.name
  subscription_id = "/subscriptions/${var.subscription_id}"

  amount     = var.budget_amount
  time_grain = "Monthly"

  time_period {
    start_date = "${formatdate("YYYY-MM", timestamp())}-01T00:00:00Z"
  }

  notification {
    enabled        = true
    threshold      = 50
    operator       = "GreaterThan"
    contact_groups = var.action_group_ids
    contact_emails = var.notification_emails
  }
}