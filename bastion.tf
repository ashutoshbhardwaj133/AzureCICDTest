resource "azurerm_bastion_host" "azurerm_bastion_host" {
  for_each            = var.azurerm_bastion_host
  name                = join("-", [each.value.name, var.application, var.environment, var.region, each.value.num])
  location            = var.location
  resource_group_name = data.azurerm_resource_group.azurerm_resource_group.name
  tags                = local.tags
  ip_configuration {
    name                 = join("-", [each.value.name, each.value.num])
    subnet_id            = azurerm_subnet.azurerm_subnet["subnet2"].id
    public_ip_address_id = azurerm_public_ip.azurerm_public_ip["pub-ip2"].id
  }

}