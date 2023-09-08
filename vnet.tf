resource "azurerm_virtual_network" "azurerm_virtual_network" {
  for_each            = var.azurerm_virtual_network
  name                = join("-", [each.value.name, var.application, var.environment, var.region, each.value.num])
  location            = var.location
  resource_group_name = data.azurerm_resource_group.azurerm_resource_group.name
  address_space       = [each.value.address_space]
  tags                = local.tags

}