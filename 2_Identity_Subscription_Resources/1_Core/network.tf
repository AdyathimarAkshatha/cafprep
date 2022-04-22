# Region 1 
# Primary vnet & Subnet
resource "azurerm_virtual_network" "Id_vnet_resource_Primaryregion1" {
  resource_group_name = azurerm_resource_group.Id_rg_resource_primaryregion1.name
  location            = azurerm_resource_group.Id_rg_resource_primaryregion1.location
  address_space       = ["10.1.0.0/16"]
  name                = var.Id_vnet_name_primaryregion1
  #dns_servers = [ "10.1.0.10" ]

}



resource "azurerm_subnet" "Id_subnet_resource_Primaryregion1" {
  resource_group_name  = azurerm_resource_group.Id_rg_resource_primaryregion1.name
  virtual_network_name = azurerm_virtual_network.Id_vnet_resource_Primaryregion1.name
  address_prefixes     = ["10.1.0.0/18"]
  name                 = var.Id_subnet_name_primaryregion1

}


# Region 1 
# secondary vnet & Subnet
resource "azurerm_virtual_network" "Id_vnet_resource_secondaryregion1" {
  resource_group_name = azurerm_resource_group.Id_rg_resource_secondaryregion1.name
  location            = azurerm_resource_group.Id_rg_resource_secondaryregion1.location
  address_space       = ["10.2.0.0/16"]
  name                = var.Id_vnet_name_secondaryregion1
  #dns_servers = [ "10.1.0.10" ]
}

resource "azurerm_subnet" "Id_subnet_resource_secondaryregion1" {
  resource_group_name  = azurerm_resource_group.Id_rg_resource_secondaryregion1.name
  virtual_network_name = azurerm_virtual_network.Id_vnet_resource_secondaryregion1.name
  address_prefixes     = ["10.2.0.0/18"]
  name                 = var.Id_subnet_name_secondaryregion1

}
