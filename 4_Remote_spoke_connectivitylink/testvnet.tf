resource "azurerm_resource_group" "peerrg" {
  name = "peerrg"
  location = "west europe"
}
resource "azurerm_virtual_network" "peerwithfw" {
name = "identityvnet"
resource_group_name = azurerm_resource_group.peerrg.name
location = azurerm_resource_group.peerrg.location
#address_prefix      = "10.0.8.0/24"
address_space = ["10.0.8.0/24"]
  
}