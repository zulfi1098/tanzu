resource "azurerm_network_security_group" "nsg_name_nic_Bootstrap" {
  name = var.nsg_name.nsg_name_nic_Bootstrap
  resource_group_name = azurerm_resource_group.rg.id
  location = var.location
  security_rule = [
    {
        name = "SSH"
        protocol = "TCP"
        source_port_range = "*"
        destination_port_range = "22"
        source_address_prefix = "*"
        destination_address_prefix = "*"
        access = "Allow"
        priority = 300
        direction = "Inbound"
    },
    {
        name = "Port_6443"
        protocol = "TCP"
        source_port_range = "*"
        destination_port_range = "6443"
        source_address_prefix = "*"
        destination_address_prefix = "*"
        access = "Allow"
        priority = 300
        direction = "Inbound"
    }
  ]
}