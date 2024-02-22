resource "azurerm_public_ip" "pip_name_vm_bootstrap" {
  name = var.cluster.pip_name_vm_bootstrap
  location = variable.location
  resource_group_name = azurerm_resource_group.rg.id
  
  sku = "Basic"
  sku_tier = "Regional"
  ip_version = "IPv4"
  allocation_method = "Dynamic"
  idle_timeout_in_minutes = 4
}