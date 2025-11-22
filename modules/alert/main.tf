resource "azurerm_consumption_budget_subscription" "spending_alert" {
  name            = var.monthly_budget_name
  subscription_id = "/subscriptions/${var.subscription_id}"

  amount     = var.budget_amount
  time_grain = "Monthly"

  time_period {
    start_date = "${formatdate("YYYY-MM", timestamp())}-01T00:00:00Z"
  }

  notification {
    enabled        = true
    threshold      = var.budget_threshold
    operator       = "GreaterThan"
    contact_groups = var.action_group_ids
    contact_emails = var.notification_emails
  }
}