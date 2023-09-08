resource "azurerm_network_security_group" "azurerm_network_security_group" {
  for_each            = var.azurerm_network_security_group
  name                = join("-", [each.value.name, var.application, var.environment, var.region, each.value.num])
  location            = var.location
  resource_group_name = data.azurerm_resource_group.azurerm_resource_group.name
  tags                = local.tags
}

resource "azurerm_network_security_rule" "azurerm_network_security_rule" {
  for_each                    = var.azurerm_network_security_rule
  name                        = "inbound-${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = data.azurerm_resource_group.azurerm_resource_group.name
  network_security_group_name = azurerm_network_security_group.azurerm_network_security_group["nsg1"].name

}

