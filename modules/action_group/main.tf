resource "azurerm_monitor_action_group" "budget_alert_group" {
  name                = var.action_group_name
  resource_group_name = var.resource_group_name
  short_name          = "agt"

  dynamic "email_receiver" {
    for_each = var.email_receivers
    content {
      name          = "email-subscription-owner"
      email_address = email_receiver.value
    }
  }
}