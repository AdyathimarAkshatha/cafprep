resource "azurerm_network_interface" "primarydcnic" {
  count               = length(var.primarydc)
  name                = "nic_${count.index}"
  #resource_group_name = data.azurerm_resource_group.im_idrgrg1primary.name
  #location            = data.azurerm_resource_group.im_idrgrg1primary.location
  resource_group_name = azurerm_resource_group.primary_dc_rg1.name
  location = azurerm_resource_group.primary_dc_rg1.location

  ip_configuration {
    name                          = "ipconfig"
    #subnet_id                     = data.azurerm_subnet.im_az_sbnt.id
    subnet_id = data.azurerm_subnet.snetprg1.id
    
    private_ip_address_allocation =  "Dynamic"
  }

}


### DC Deployment 
resource "azurerm_windows_virtual_machine" "primary_dc" {
  #count               = length(var.appsrname)
  count = length(var.primarydc)
  name                = var.primarydc[count.index]
 # resource_group_name = data.azurerm_resource_group.im_idrgrg1primary.name
  #location            = data.azurerm_resource_group.im_idrgrg1primary.location
  resource_group_name = azurerm_resource_group.primary_dc_rg1.name
  location = azurerm_resource_group.primary_dc_rg1.location
  size                = "Standard_D4s_v4"
  admin_username      = "localadmin"
  admin_password      = "Cloudteam@2019!"
  network_interface_ids = [
    azurerm_network_interface.primarydcnic.*.id[count.index],
  ]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

}

### Managed disks 

resource "azurerm_managed_disk" "dcdisk" {
  count                = length(var.primarydc)
  name                 = "data_disk_${count.index}"
  resource_group_name = azurerm_resource_group.primary_dc_rg1.name
  location = azurerm_resource_group.primary_dc_rg1.location
  #resource_group_name  = data.azurerm_resource_group.im_idrgrg1primary.name
  #location             = data.azurerm_resource_group.im_idrgrg1primary.location
  storage_account_type = "Premium_LRS"
  create_option        = "Empty"
  disk_size_gb         = "128"


  
}

resource "azurerm_virtual_machine_data_disk_attachment" "diskdisk_attach" {
  count              = length(var.primarydc)
  managed_disk_id    = element(azurerm_managed_disk.dcdisk[*].id, count.index)
  virtual_machine_id = element(azurerm_windows_virtual_machine.primary_dc[*].id, count.index)
  lun                = "10"
  caching            = "ReadWrite"
}


###  Domain Join


/*
resource "azurerm_virtual_machine_extension" "domjoin" {
  name                 = "domjoin"
  count                = length(var.primarydc)
  virtual_machine_id   = element(azurerm_windows_virtual_machine.primary_dc[*].id, count.index)
  publisher            = "Microsoft.Compute"
  type                 = "JsonADDomainExtension"
  type_handler_version = "1.3"
  settings             = <<SETTINGS
{
"Name": "eriks.com",
"OUPath": "OU=Servers,DC=eriks,DC=com",
"User": "eriks\adm-akshatha",
"Restart": "true",
"Options": "3"
}
SETTINGS
  protected_settings   = <<PROTECTED_SETTINGS
{
"Password": "--"
}
PROTECTED_SETTINGS
}

*/

