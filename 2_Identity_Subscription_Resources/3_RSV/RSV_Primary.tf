resource "azurerm_recovery_services_vault" "rsv_primary" {
  name = "rsv-weu-id-01"
  resource_group_name = data.azurerm_resource_group.im_idrgrg1primary.name
  location = data.azurerm_resource_group.im_idrgrg1primary.location
  sku = "Standard"
  }

 

  resource "azurerm_backup_policy_vm" "backup_policy_primary_id" {
  name                = "policy-weu-id-01"
  resource_group_name = data.azurerm_resource_group.im_idrgrg1primary.name
  recovery_vault_name = azurerm_recovery_services_vault.rsv_primary.name

  timezone = "UTC"

  backup {
    frequency = "Daily"
    time      = "23:00"
  }

  retention_daily {
    count = 10
  }

  retention_weekly {
    count    = 42
    weekdays = ["Sunday", "Wednesday", "Friday", "Saturday"]
  }

  retention_monthly {
    count    = 7
    weekdays = ["Sunday", "Wednesday"]
    weeks    = ["First", "Last"]
  }

  retention_yearly {
    count    = 77
    weekdays = ["Sunday"]
    weeks    = ["Last"]
    months   = ["January"]
  }
}