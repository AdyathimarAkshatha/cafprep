#Region 1
#Resource Group for identity - Primary
variable "Id_rg_name_primaryregion1" {
  default = "rg-weu-id-01"
}

#Resource Group for identity - Secondary
variable "Id_rg_name_sencondaryregion1" {
  default = "rg-neu-id-01"
}

#Region 1
#Primary region network resource for identity 
variable "Id_vnet_name_primaryregion1" {
  default = "vn-weu-p-id-01"
}

variable "Id_subnet_name_primaryregion1" {
  default = "sn-weu-p-id-01"
}

#Region 1
#Secondary region network resource
variable "Id_vnet_name_secondaryregion1" {
  default = "vn-neu-p-id-01"
}

variable "Id_subnet_name_secondaryregion1" {
  default = "sn-neu-p-id-01"
}

