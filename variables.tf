

variable "location" {
  default = "West Europe"
}
variable "vnet_name" {
  default = "yll-vnet"
}
variable "subnet_name" {
  default = "yll-subnet"
}
variable "address_space" {
  default = ["10.0.0.0/16"]
}
variable "subnet_prefix" {
  default = "10.0.1.0/24"
}
variable "nsg_name" {
  default = "yll-vm-nsg"
}
variable "vm_name" {
  default = "yll-vm"
}
variable "vm_size" {
  default = "Standard_B1s"
}
variable "admin_username" {
  default = "yll"
}
variable "ssh_public_key_path" {
  default = "~/.ssh/id_rsa.pub"
}
variable "public_ip_name" {
  description = "Name of the public IP address"
  default     = "yll-public-ip"
}
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "yll-devops"
}
