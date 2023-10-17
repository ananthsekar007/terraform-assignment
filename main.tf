
module "rg" {
  source = "./modules/resource_group"
  rg_name = [ var.resource_group_name ]
  location = var.location
  common_tags = var.tags
}

module "networking" {
  source = "./modules/networking"
  cidr_block = var.vnet_address
  subnet_names = var.subnet_names
  location = var.location
  vnet_name = var.vnet_name
  common_tags = var.tags
  rg_name = module.rg.rg_name
}

resource "azurerm_public_ip" "vmss_public_ip" {
  name                = var.vmss_public_ip_name
  location            = var.location
  resource_group_name = module.rg.rg_name
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
  rg_name = module.rg.rg_name
  location = module.rg.rg_location
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
}

resource "azurerm_traffic_manager_profile" "traffic_manager_profile" {
  name                   = var.traffic_manager_profile_name
  resource_group_name    = module.rg.rg_name
  traffic_routing_method = "Weighted"
  dns_config {
    relative_name = var.traffic_manager_profile_name
    ttl           = 100
  }
  monitor_config {
    protocol                     = "HTTP"
    port                         = var.application_port
    path                         = "/"
    interval_in_seconds          = 30
    timeout_in_seconds           = 9
    tolerated_number_of_failures = 3
  }

  tags = var.tags
}

resource "azurerm_traffic_manager_azure_endpoint" "example" {
  name               = var.traffic_manager_endpoint_name
  profile_id         = azurerm_traffic_manager_profile.traffic_manager_profile.id
  weight             = 100
  target_resource_id = azurerm_public_ip.vmss_public_ip.id
}

resource "azurerm_mysql_flexible_server" "sql_server" {
  name = var.mysql_server_name
  location = module.rg.rg_location
  resource_group_name = module.rg.rg_name
  administrator_login = var.admin_user
  administrator_password = var.admin_password
  sku_name = "GP_Standard_D2ds_v4"
  storage {
    iops    = 360
    size_gb = 20
  }
  zone = 3
}

resource "azurerm_private_endpoint" "name" {
  name                = var.mysql_server_private_endpoint_name
  location            = module.rg.rg_location
  resource_group_name = module.rg.rg_name
  subnet_id           = azurerm_subnet.vmss_subnets["AppSubnet"].id
  private_service_connection {
    name                           = "privateconnection"
    subresource_names              = [var.mysql_server_name]
    is_manual_connection           = false
    private_connection_resource_id = azurerm_mysql_flexible_server.sql_server.id
  }
}
