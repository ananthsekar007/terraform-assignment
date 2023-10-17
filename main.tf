resource azurerm_resource_group rg_old {
  name = var.resource_group_name
  location = var.location
}

module "networking" {
  source = "./modules/networking"
  cidr_block = var.vnet_address
  subnet_names = var.subnet_names
  location = var.location
  vnet_name = var.vnet_name
  common_tags = var.tags
  rg_name = var.resource_group_name
}

resource "azurerm_public_ip" "vmss_public_ip" {
  name                = var.vmss_public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  tags                = var.tags
  domain_name_label   = "lbdomainname"
}

module "load_balancing" {
  source = "./modules/balancers"
  application_port = var.application_port
  common_tags = var.tags
  load_balancer_name = var.load_balancer_name
  public_ip_id = azurerm_public_ip.vmss_public_ip.id
  rg_name = var.resource_group_name
  location = var.location
}

module "compute" {
  source = "./modules/compute/linux_vmss"
  admin_password = var.admin_password
  admin_user = var.admin_user
  backend_address_pool_ids = [ module.load_balancing.lb_backend_address_pool.id ]
  common_tags = var.tags
  custom_script = file("web.conf")
  disable_password_authentication = false
  initial_vm_count = 2
  sku_name = "Standard_DS1_v2"
  subnet_id = module.networking.subnets["AppSubnet"].id
  vmss_name = var.vmss_name
  location = var.location
  rg_name = var.resource_group_name
}

module "traffic_manager" {
  source = "./modules/traffic_manager"
  application_port = var.application_port
  common_tags = var.tags
  traffic_manager_endpoint_name = var.traffic_manager_endpoint_name
  traffic_manager_profile_name = var.traffic_manager_profile_name
  public_ip_id = azurerm_public_ip.vmss_public_ip.id
  rg_name = var.resource_group_name
}

module "server" {
  source = "./modules/db_server/mysql"
  admin_password = var.admin_password
  admin_user = var.admin_user
  location = var.location
  rg_name = var.resource_group_name
  private_endpoint_name = var.mysql_server_private_endpoint_name
  server_name = var.mysql_server_name
  sku_name = "GP_Standard_D2ds_v4"
  subnet_id = module.networking.subnets["AppSubnet"].id
  zone = 3
}

resource "azurerm_private_endpoint" "private_endpoint" {
  name                = var.mysql_server_private_endpoint_name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = module.networking.subnets["AppSubnet"].id
  private_service_connection {
    name                           = "privateconnection"
    subresource_names              = [ "mysqlServer" ]
    is_manual_connection           = false
    private_connection_resource_id = module.server.sql.id
  }
}

module "secondary_networking"  {
  source = "./modules/networking"
  cidr_block = var.secondary_vnet_address
  subnet_names = var.secondary_subnet_names
  location = var.secondary_location
  vnet_name = var.secondary_vnet_name
  common_tags = var.tags
  rg_name = var.resource_group_name
}

module "secondary_server" {
  source = "./modules/db_server/mysql"
  admin_password = var.admin_password
  admin_user = var.admin_user
  location = var.secondary_location
  rg_name = var.resource_group_name
  private_endpoint_name = var.mysql_server_private_endpoint_name
  server_name = var.secondary_mysql_server_name
  sku_name = "GP_Standard_D2ds_v4"
  subnet_id = module.secondary_networking.subnets["DBSubnet"].id
  zone = null
}