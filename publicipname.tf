resource "azurerm_public_ip" "publicipname" {
  name = variable.cluster.publicipname
  location = variable.location
  resource_group_name = azurerm_resource_group.rg.id
  sku = "Standard"
  ip_version = "IPv4"
  allocation_method = "Static"
  idle_timeout_in_minutes = 4
}