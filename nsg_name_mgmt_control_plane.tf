resource "azurerm_network_security_group" "nsg_name_mgmt_control_plane" {
  name = var.nsg_name.nsg_name_mgmt_control_plane
  resource_group_name = azurerm_resource_group.rg.id
  location = variable.location
  security_rule = [
    {
        name = "Port_SSH"
        protocol = "TCP"
        source_port_range = "*"
        destination_port_range = "22"
        source_address_prefix = "*"
        destination_address_prefix = "*"
        access = "Allow"
        priority = 100
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
        priority = 110
        direction = "Inbound"
    },
    {
        name = "SaaS_Pinniped_443"
        protocol = "TCP"
        source_port_range = "*"
        destination_port_range = "6443"
        source_address_prefix = "*"
        destination_address_prefix = "*"
        access = "Allow"
        priority = 320
        direction = "Inbound"
    }
  ]
}