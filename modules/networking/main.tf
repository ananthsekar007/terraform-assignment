resource "azurerm_virtual_network" "vmss_vnet" {
  name                = var.vnet_name
  address_space       = [ var.cidr_block ]
  location            = var.location
  resource_group_name = var.rg_name
  tags                = var.common_tags
}

resource "azurerm_subnet" "vmss_subnets" {
  for_each             = var.subnet_names
  name                 = each.key
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vmss_vnet.name
  address_prefixes     = [cidrsubnet(var.cidr_block, 8, each.value)]
}