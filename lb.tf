resource "azurerm_lb" "azurerm_lb" {
  for_each            = var.azurerm_lb
  name                = join("-", [each.value.name, var.application, var.environment, var.region, each.value.num])
  resource_group_name = data.azurerm_resource_group.azurerm_resource_group.name
  location            = var.location
  sku                 = "Standard"
  frontend_ip_configuration {
    name                 = join("-", [each.value.name, each.value.num])
    public_ip_address_id = azurerm_public_ip.azurerm_public_ip["pub-ip3"].id
  }

  tags = local.tags
}

resource "azurerm_lb_backend_address_pool" "azurerm_lb_backend_address_pool" {
  for_each        = var.azurerm_lb_backend_address_pool
  name            = join("-", [each.value.name, var.application, var.environment, var.region, each.value.num])
  loadbalancer_id = azurerm_lb.azurerm_lb["lb1"].id

}


resource "azurerm_lb_probe" "azurerm_lb_probe" {
  for_each        = var.azurerm_lb_probe
  name            = join("-", [each.value.name, var.application, var.environment, var.region, each.value.num])
  loadbalancer_id = azurerm_lb.azurerm_lb["lb1"].id
  port            = each.value.port
  protocol        = each.value.protocol
}

resource "azurerm_lb_rule" "azurerm_lb_rule" {
  for_each                       = var.azurerm_lb_rule
  name                           = join("-", [each.value.name, var.application, var.environment, var.region, each.value.num])
  protocol                       = each.value.protocol
  frontend_port                  = each.value.frontend-port
  backend_port                   = each.value.backend-port
  frontend_ip_configuration_name = "lb-001"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.azurerm_lb_backend_address_pool["lb-pool1"].id]
  loadbalancer_id                = azurerm_lb.azurerm_lb["lb1"].id

}


resource "azurerm_network_interface_backend_address_pool_association" "azurerm_network_interface_backend_address_pool_association" {
  backend_address_pool_id = azurerm_lb_backend_address_pool.azurerm_lb_backend_address_pool["lb-pool1"].id
  network_interface_id    = azurerm_network_interface.azurerm_network_interface["nic1"].id
  ip_configuration_name   = "nic1"

}