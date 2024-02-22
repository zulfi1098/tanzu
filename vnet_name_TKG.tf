resource "azurerm_virtual_network" "virtualNetwork" {
  name                = var.cluster.vnet_name_TKG
  resource_group_name = azurerm_resource_group.rg.id
  location            = var.location
  
depends_on = [ 
  ]

  address_space       = [var.cluster.vnet_cidr_TKG]
}

resource "azurerm_subnet" "subnet_name_Bootstrap" {

      name = var.cluster.subnet_name_Bootstrap
      address_prefixes = [var.cluster.subnet_cidr_Bootstrap]
      resource_group_name = azurerm_resource_group.rg.id
      virtual_network_name =  azurerm_virtual_network.virtualNetwork.id
      enforce_private_link_endpoint_network_policies = true
      enforce_private_link_service_network_policies = true
      
}

resource "azurerm_subnet" "subnet_name_MgmtControl" {

      name = var.cluster.subnet_name_MgmtControl
      address_prefixes = [var.cluster.subnet_cidr_MgmtControl]
      resource_group_name = azurerm_resource_group.rg.id
      virtual_network_name =  azurerm_virtual_network.virtualNetwork.id
      enforce_private_link_endpoint_network_policies = true
      enforce_private_link_service_network_policies = true
      
}

resource "azurerm_subnet" "subnet_name_MgmtWorker" {

      name = var.cluster.subnet_name_MgmtWorker
      address_prefixes = [var.cluster.subnet_cidr_MgmtWorker]
      resource_group_name = azurerm_resource_group.rg.id
      virtual_network_name =  azurerm_virtual_network.virtualNetwork.id
      enforce_private_link_endpoint_network_policies = true
      enforce_private_link_service_network_policies = true
      
}


resource "azurerm_subnet" "subnet_name_WorkloadControl" {

      name = var.cluster.subnet_name_WorkloadControl
      address_prefixes = [var.cluster.subnet_cidr_WorkloadControl]
      resource_group_name = azurerm_resource_group.rg.id
      virtual_network_name =  azurerm_virtual_network.virtualNetwork.id
      enforce_private_link_endpoint_network_policies = true
      enforce_private_link_service_network_policies = true
      
}
resource "azurerm_subnet" "subnet_name_WorkloadWorker" {

      name = var.cluster.subnet_name_WorkloadWorker
      address_prefixes = [var.cluster.subnet_cidr_WorkloadWorker]
      resource_group_name = azurerm_resource_group.rg.id
      virtual_network_name =  azurerm_virtual_network.virtualNetwork.id
      enforce_private_link_endpoint_network_policies = true
      enforce_private_link_service_network_policies = true
      
}