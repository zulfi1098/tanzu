resource "azurerm_network_security_group" "nsg_name_workload_control_plane" {
  name = var.nsg_name.nsg_name_workload_control_plane
  resource_group_name = azurerm_resource_group.rg.id
  location = var.location
  security_rule = [
    {
        name = "SSH"
        protocol = "Tcp"
        source_port_range = "*"
        destination_port_range = "22"
        source_address_prefix = "*"
        destination_address_prefix = "*"
        access = "Allow"
        priority = 300
        direction = "Inbound"
         source_port_ranges = []
        destination_port_ranges = []
        source_address_prefixes = []
        destination_address_prefixes =[]
        description = "Port open"
        source_application_security_group_ids = []
        destination_application_security_group_ids = []
    },
    {
        name = "Port_6443"
        protocol = "Tcp"
        source_port_range = "*"
        destination_port_range = "6443"
        source_address_prefix = "*"
        destination_address_prefix = "*"
        access = "Allow"
        priority = 310
        direction = "Inbound"
         source_port_ranges = []
        destination_port_ranges = []
        source_address_prefixes = []
        destination_address_prefixes =[]
        description = "Port open"
        source_application_security_group_ids = []
        destination_application_security_group_ids = []
    },
    {
        name = "SaaS_Services_443"
        protocol = "Tcp"
        source_port_range = "*"
        destination_port_range = "6443"
        source_address_prefix = "*"
        destination_address_prefix = "*"
        access = "Allow"
        priority = 320
        direction = "Inbound"
         source_port_ranges = []
        destination_port_ranges = []
        source_address_prefixes = []
        destination_address_prefixes =[]
        description = "Port open"
        source_application_security_group_ids = []
        destination_application_security_group_ids = []
    }
  ]
}