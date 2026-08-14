variable "vnet" {
  type = any
}

resource "azurerm_virtual_network" "this" {
  for_each = var.vnet

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  address_space       = each.value.address_space
  tags                = each.value.tags
}
