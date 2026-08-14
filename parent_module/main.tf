module "rg" {
  source = "../child_module/azurerm_rg"
  rg     = var.rg
}

module "vnet" {
  source     = "../child_module/azurerm_vnet"
  vnet       = var.vnet
  depends_on = [module.rg]
}

module "subnet" {
  source     = "../child_module/azurerm_subnet"
  subnet     = var.subnet
  depends_on = [module.rg, module.vnet]
}

module "pip" {
  source     = "../child_module/azurerm_pip"
  pip        = var.pip
  depends_on = [module.rg]
}

module "nic" {
  source     = "../child_module/azurerm_nic"
  nic        = var.nic
  depends_on = [module.rg, module.subnet, module.pip]
}

module "vm" {
  source     = "../child_module/azurerm_vm"
  vm         = var.vm
  depends_on = [module.rg, module.nic]
}

module "bastion" {
  source     = "../child_module/azurerm_bastion"
  bastion    = var.bastion
  depends_on = [module.rg, module.subnet, module.pip]
}

module "nsg" {
  source     = "../child_module/azurerm_nsg"
  nsg        = var.nsg
  depends_on = [module.rg, module.subnet]
}
