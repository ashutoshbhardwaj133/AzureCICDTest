resource "azurerm_linux_virtual_machine" "azurerm_linux_virtual_machine" {
  for_each              = var.azurerm_linux_virtual_machine
  name                  = join("-", [each.value.name, var.application, var.environment, var.region, each.value.num])
  resource_group_name   = data.azurerm_resource_group.azurerm_resource_group.name
  location              = var.location
  size                  = "Standard_D2_v4"
  admin_username        = "adminuser"
  network_interface_ids = [azurerm_network_interface.azurerm_network_interface["nic1"].id]

  admin_ssh_key {
    username = "adminuser"

    public_key = file("${path.module}/id_rsa.pub")
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  tags        = local.tags
  custom_data = filebase64("${path.module}/script.sh")

}

