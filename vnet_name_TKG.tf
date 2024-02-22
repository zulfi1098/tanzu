resource "azurerm_virtual_network" "virtualNetwork" {
  name                = var.cluster.vnet_name_TKG
  resource_group_name = azurerm_resource_group.rg.id
  location            = variable.location

depends_on = [ 
  ]

  address_space       = var.cluster.vnet_cidr_TKG
  subnet = [  
    {
       name = var.cluster.subnet_name_Bootstrap
      resource_group_name = azurerm_resource_group.rg.id
      address_prefixes = var.cluster.subnet_cidr_Bootstrap
      virtual_network_name = azurerm_virtual_network.natgatewayname.id

      private_endpoint_network_policies_enabled = true
      private_link_service_network_policies_enabled = true

    },
    {
      name = var.cluster.subnet_name_MgmtControl
      resource_group_name = azurerm_resource_group.rg.id
      address_prefixes = var.cluster.subnet_cidr_MgmtControl
      virtual_network_name = azurerm_virtual_network.natgatewayname.id

      private_endpoint_network_policies_enabled = true
      private_link_service_network_policies_enabled = true
    },
    {
       name = var.cluster.subnet_name_MgmtWorker
      resource_group_name = azurerm_resource_group.rg.id
      address_prefixes = var.cluster.subnet_cidr_MgmtWorker
      virtual_network_name = azurerm_virtual_network.natgatewayname.id

      private_endpoint_network_policies_enabled = true
      private_link_service_network_policies_enabled = true

    },
    {
      name = var.cluster.subnet_name_WorkloadControl
      resource_group_name = azurerm_resource_group.rg.id
      address_prefixes = var.cluster.subnet_cidr_WorkloadControl
      virtual_network_name = azurerm_virtual_network.natgatewayname.id

      private_endpoint_network_policies_enabled = true
      private_link_service_network_policies_enabled = true
    },
    {
      name = var.cluster.subnet_name_WorkloadWorker
      resource_group_name = azurerm_resource_group.rg.id
      address_prefixes = var.cluster.subnet_cidr_WorkloadWorker
      virtual_network_name = azurerm_virtual_network.natgatewayname.id

      private_endpoint_network_policies_enabled = true
      private_link_service_network_policies_enabled = true
    }
  ]
 
}

