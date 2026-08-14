variable "rg" {
  type = any
}

resource "azurerm_resource_group" "this" {
  for_each = var.rg

  name     = each.value.name
  location = each.value.location
  tags     = each.value.tags
}
