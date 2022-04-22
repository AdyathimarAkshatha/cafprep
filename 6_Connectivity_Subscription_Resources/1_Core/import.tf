data "azurerm_resource_group" "idrg" {
  name = "peerrg"
}

data "azurerm_virtual_network" "idpeervnet" {
  name = "identityvnet"
  resource_group_name = data.azurerm_resource_group.idrg.name
  
}