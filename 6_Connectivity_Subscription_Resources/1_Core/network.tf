resource "azurerm_virtual_wan" "example" {


  name                = "example-vwan"
  resource_group_name = azurerm_resource_group.examplerg.name
  location            = azurerm_resource_group.examplerg.location
}

resource "azurerm_virtual_hub" "example" {

  name                = "example-vhub"
  resource_group_name = azurerm_resource_group.examplerg.name
  location            = azurerm_resource_group.examplerg.location
  virtual_wan_id      = azurerm_virtual_wan.example.id
  address_prefix      = "10.0.5.0/24"
}

resource "azurerm_virtual_hub_connection" "example" {
 

  name                      = "example-vhub-connection"
  virtual_hub_id            = azurerm_virtual_hub.example.id
  remote_virtual_network_id = azurerm_virtual_network.example1.id

}


