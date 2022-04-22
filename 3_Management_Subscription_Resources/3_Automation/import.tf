data "azurerm_resource_group" "im_mgrgrg1primary" {
  name = "rg-weu-mgnt-01"
}

data "azurerm_resource_group" "im_mgrgrg1secondary" {
  name = "rg-neu-mgnt-01"
}