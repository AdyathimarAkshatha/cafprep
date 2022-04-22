
data "azurerm_resource_group" "im_idrgrg1primary" {
  name = "rg-weu-id-01"
}

data "azurerm_resource_group" "im_idrgrg1secondary" {
  name = "rg-neu-id-01"

}

