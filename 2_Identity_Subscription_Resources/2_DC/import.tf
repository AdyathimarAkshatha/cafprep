
data "azurerm_resource_group" "im_idrgrg1primary" {
  name = "rg-weu-id-01"
}

data "azurerm_resource_group" "im_idrgrg1secondary" {
  name = "rg-neu-id-01"

}
data "azurerm_virtual_network" "vnetprg1" {
  name = "vn-weu-p-id-01"
  resource_group_name = data.azurerm_resource_group.im_idrgrg1primary.name
}

data "azurerm_virtual_network" "vnetscg1" {
  name = "vn-neu-p-id-01"
  resource_group_name = data.azurerm_resource_group.im_idrgrg1secondary.name
}

data "azurerm_subnet" "snetprg1" {
  name = "sn-weu-p-id-01"
  resource_group_name = data.azurerm_resource_group.im_idrgrg1primary.name
  virtual_network_name = data.azurerm_virtual_network.vnetprg1.name

}

data "azurerm_subnet" "snetscg1" {
  name = "sn-neu-p-id-01"
  resource_group_name = data.azurerm_resource_group.im_idrgrg1secondary.name
  virtual_network_name = data.azurerm_virtual_network.vnetscg1.name

}
