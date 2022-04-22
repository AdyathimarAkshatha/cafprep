variable "primarydc" {
  default = ["vmdc-weu-01", "vmdc-weu-02"]
  

}

variable "primarydcrg" {
  default = "rg-weu-dc-01"
}

variable "primarydcloc" {
  default = "West Europe"

}