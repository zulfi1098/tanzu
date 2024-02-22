resource "azurerm_nat_gateway" "natgatewayname" {
    name = var.cluster.natgatewayname
    location = var.location
    resource_group_name = azurerm_resource_group.rg.id
    depends_on = [ 
                    azurerm_public_ip.publicipname, 
                    azurerm_public_ip.publicipprefixname 
        ]

    idle_timeout_in_minutes =4

}

resource "azurerm_nat_gateway_public_ip_association" "natgatewayname-ip-association" {
  nat_gateway_id = azurerm_nat_gateway.natgatewayname.id
  public_ip_address_id = azurerm_public_ip.publicipname.id
}

resource "azurerm_public_ip_prefix" "publicipprefixname" {
    name = var.publicipprefixname
    location = var.location
    resource_group_name = azurerm_resource_group.rg.id

  
}

resource "azurerm_nat_gateway_public_ip_prefix_association" "natgatewayname-ip-prefix-association" {
    nat_gateway_id = azurerm_nat_gateway.natgatewayname.id
    public_ip_prefix_id = azurerm_public_ip_prefix.publicipprefixname.id
  
}