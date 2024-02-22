resource "azurerm_virtual_machine" "vm_name_Bootstrap" {
  name = var.cluster.vm_name_Bootstrap
  resource_group_name = azurerm_resource_group.rg.id
  location = variable.location
  network_interface_ids = [azurerm_network_interface.nic_name_Bootstrap.id]
  
  vm_size = var.cluster.vm_size

  storage_image_reference {
    publisher = "canonical"
    offer = "0001-com-ubuntu-server-focal"
    sku = "20_04-lts"
    version = "latest"

  }
  storage_os_disk {
    os_type = "Linux"
    name = "${var.cluster.vm_name_Bootstrap}_OsDisk"
    create_option = "FromImage"
    caching = "ReadWrite"
  }
  os_profile {
    computer_name = var.cluster.vm_name_Bootstrap
    admin_username = var.cluster.vm_admin_name
    admin_password = var.cluster.vm_admin_pwd
    
  }
  os_profile_linux_config {
    disable_password_authentication = false

  }
  
  
  

  depends_on = [  azurerm_network_interface.nic_name_Bootstrap ]
}