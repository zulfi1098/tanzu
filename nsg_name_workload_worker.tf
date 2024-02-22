resource "azurerm_network_security_group" "nsg_name_workload_worker" {
  name = var.nsg_name.nsg_name_workload_worker
  resource_group_name = azurerm_resource_group.rg.id
  location = var.location
}