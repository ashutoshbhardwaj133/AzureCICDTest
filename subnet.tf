resource "azurerm_subnet" "azurerm_subnet" {
  for_each             = var.azurerm_subnet
  name                 = each.value.name
  address_prefixes     = [each.value.address_space]
  resource_group_name  = data.azurerm_resource_group.azurerm_resource_group.name
  virtual_network_name = azurerm_virtual_network.azurerm_virtual_network["vnet1"].name
}

resource "azurerm_subnet_network_security_group_association" "azurerm_subnet_network_security_group_association" {
  network_security_group_id = azurerm_network_security_group.azurerm_network_security_group["nsg1"].id
  subnet_id                 = azurerm_subnet.azurerm_subnet["subnet1"].id

}