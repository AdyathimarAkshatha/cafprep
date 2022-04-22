resource "azurerm_log_analytics_workspace" "law_resource_primary" {
  name = var.lawprimary
  resource_group_name = data.azurerm_resource_group.im_mgrgrg1primary.name
  location = data.azurerm_resource_group.im_mgrgrg1primary.location
  #internet_ingestion_enabled = false
  #internet_query_enabled = false
  #daily_quota_gb = 1
  #retention_in_days = "360"
  
  }

  resource "azurerm_log_analytics_workspace" "law_resource_secondary" {
  name = var.lawsecondary
  resource_group_name = data.azurerm_resource_group.im_mgrgrg1secondary.name
  location = data.azurerm_resource_group.im_mgrgrg1secondary.location
  #internet_ingestion_enabled = false
  #internet_query_enabled = false
  #daily_quota_gb = 1
  #retention_in_days = "360"
  
  }