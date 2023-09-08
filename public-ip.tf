resource "azurerm_public_ip" "azurerm_public_ip" {
  for_each            = var.azurerm_public_ip
  name                = join("-", [each.value.name, var.application, var.environment, var.region, each.value.num])
  resource_group_name = data.azurerm_resource_group.azurerm_resource_group.name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = local.tags

}