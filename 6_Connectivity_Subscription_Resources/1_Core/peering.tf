resource "azurerm_virtual_network_peering" "fwtoid" {
  name                      = "peer1to2"
  resource_group_name       = azurerm_resource_group.examplerg.name
  virtual_network_name      = azurerm_virtual_network.example1.name
  remote_virtual_network_id = data.azurerm_virtual_network.idpeervnet.id
}

resource "azurerm_virtual_network_peering" "idtofw" {
  name                      = "peer2to1"
  resource_group_name       = azurerm_resource_group.examplerg.name
  virtual_network_name      = data.azurerm_virtual_network.idpeervnet.name
  remote_virtual_network_id = azurerm_virtual_network.example1.id
}