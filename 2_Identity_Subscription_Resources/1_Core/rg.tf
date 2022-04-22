

resource "azurerm_resource_group" "Id_rg_resource_primaryregion1" {
  name = var.Id_rg_name_primaryregion1
  #region = "West Europe"
  location = "West Europe"
}

resource "azurerm_resource_group" "Id_rg_resource_secondaryregion1" {
  name = var.Id_rg_name_sencondaryregion1
  #region = "North Europe"
  location = "North Europe"
}