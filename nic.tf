resource "azurerm_network_interface" "azurerm_network_interface" {
  for_each            = var.azurerm_network_interface
  name                = join("-", [each.value.name, var.application, var.environment, var.region, each.value.num])
  location            = var.location
  resource_group_name = data.azurerm_resource_group.azurerm_resource_group.name
  tags                = local.tags
  ip_configuration {
    name                          = "nic1"
    subnet_id                     = azurerm_subnet.azurerm_subnet["subnet1"].id
    private_ip_address_allocation = "Dynamic"
    #public_ip_address_id          = azurerm_public_ip.azurerm_public_ip["pub-ip1"].id
  }

}