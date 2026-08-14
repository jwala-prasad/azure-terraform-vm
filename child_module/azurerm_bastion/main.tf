variable "bastion" {
  type = any
}

resource "azurerm_bastion_host" "this" {
  for_each = var.bastion

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  tags                = each.value.tags

  ip_configuration {
    name                 = "${each.value.name}-ipconfig"
    subnet_id            = data.azurerm_subnet.this[each.key].id
    public_ip_address_id = data.azurerm_public_ip.this[each.key].id
  }
}
