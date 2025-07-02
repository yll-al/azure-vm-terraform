
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# NETWORK MODULE
module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  vnet_name           = var.vnet_name
  subnet_name         = var.subnet_name
  address_space       = var.address_space
  subnet_prefix       = var.subnet_prefix
}

# NSG MODULE
module "nsg" {
  source              = "./modules/nsg"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  nsg_name            = var.nsg_name
}

# VM MODULE
module "vm" {
  source                = "./modules/vm"
  resource_group_name   = var.resource_group_name
  location              = var.location

  vm_name               = var.vm_name
  vm_size               = var.vm_size
  admin_username        = var.admin_username
  ssh_public_key_path   = var.ssh_public_key_path

  nic_name              = "${var.vm_name}-nic"
  public_ip_name        = "${var.vm_name}-pip"

  subnet_id             = module.network.subnet_id
  nsg_id                = module.nsg.nsg_id
}
