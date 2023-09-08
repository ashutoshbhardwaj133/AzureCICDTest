

variable "application" { default = "pes-arche" }
variable "environment" { default = "poc" }
variable "managed_by" { default = "terraform" }
variable "region" { default = "southeast-asia" }
variable "location" { default = "southeast asia" }

variable "azurerm_resource_group" {
  default = {
    rg1 = { name = "rg", num = "001" }
  }
}

variable "azurerm_virtual_network" {
  default = {
    vnet1 = { name = "vnet", num = "001", address_space = "10.6.0.0/16" }
  }
}

variable "azurerm_subnet" {
  default = {
    subnet1 = { name = "subnet1", address_space = "10.6.1.0/24" }
    subnet2 = { name = "AzureBastionSubnet", address_space = "10.6.2.0/24" }
  }
}

variable "azurerm_network_security_group" {
  default = {
    nsg1 = { name = "nsg", num = "001" }
  }
}

variable "azurerm_network_security_rule" {
  default = {
    100 = "80",
    101 = "8080",
    102 = "443"
    103 = "22"
    104 = "9000"
    105 = "8081"
  }
}

variable "azurerm_public_ip" {
  default = {
    #pub-ip1 = { name = "pub-ip", num = "001" }
    pub-ip2 = { name = "pub-ip", num = "002" }
    pub-ip3 = { name = "pub-ip", num = "003" }
  }

}
variable "azurerm_network_interface" {
  default = {
    nic1 = { name = "nic", num = "001" }
  }

}

variable "azurerm_linux_virtual_machine" {
  default = {
    vm1 = { name = "vm", num = "001" }
  }

}

variable "azurerm_bastion_host" {
  default = {
    bastion1 = { name = "bastion", num = "001" }
  }

}

variable "azurerm_lb" {
  default = {
    lb1 = { name = "lb", num = "001" }
  }

}

variable "azurerm_lb_backend_address_pool" {
  default = {
    lb-pool1 = { name = "backend-pool", num = "001" }
  }

}

variable "azurerm_lb_probe" {
  default = {
    prob1 = { name = "prob", num = "001", port = "80", protocol = "Tcp" }
  }

}

variable "azurerm_lb_rule" {
  default = {
    rule1 = { name = "lb-rule", num = "001", protocol = "Tcp", frontend-port = "8080", backend-port = "8080" }
    rule2 = { name = "lb-rule", num = "002", protocol = "Tcp", frontend-port = "9000", backend-port = "9000" }
    rule3 = { name = "lb-rule", num = "003", protocol = "Tcp", frontend-port = "8081", backend-port = "8081" }
  }

}

variable "azurerm_kubernetes_cluster" {
  default = {
    aks1 = {name = "aks", num = "001"}
  }
  
}