resource "azurerm_virtual_network" "example1" {
resource_group_name = azurerm_resource_group.examplerg.name
  location            = azurerm_resource_group.examplerg.location
  address_space       = ["72.0.5.0/24"]
  name                = "fwvnet"
  

}