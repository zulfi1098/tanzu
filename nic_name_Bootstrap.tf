resource "azurerm_network_interface" "nic_name_Bootstrap" {
  name = var.cluster.nic_name_Bootstrap
  resource_group_name = azurerm_resource_group.rg.id
  location = var.location

  ip_configuration {
    name = "ipconfig1"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.publicipname.id
    subnet_id = azurerm_subnet.subnet_name_Bootstrap.id
    primary = true
    private_ip_address = "IPv4"
  }
  enable_accelerated_networking = true
  enable_ip_forwarding = false 
  
  

  depends_on = [  
    azurerm_public_ip.pip_name_vm_bootstrap,
    azurerm_virtual_network.virtualNetwork,
    azurerm_network_security_group.nsg_name_nic_Bootstrap
  ]
}

resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.nic_name_Bootstrap.id
  network_security_group_id = azurerm_network_security_group.nsg_name_nic_Bootstrap.id
}