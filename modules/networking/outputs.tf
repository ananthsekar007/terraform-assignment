output "vnet" {
    value = azurerm_virtual_network.vmss_vnet
}

output "subnets" {
  value = azurerm_subnet.vmss_subnets
}