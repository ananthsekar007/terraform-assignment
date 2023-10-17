terraform {
  required_version = ">=0.12"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "ananth-group"
    storage_account_name = "terraformstateananth"
    container_name       = "terraform-global-state"
    key                  = "terraform.tfstate"
  }
}

module "rg" {
  source = "./modules/resource_group"
  rg_name = var.resource_group_name
  location = var.location
  common_tags = var.tags
}


resource "azurerm_virtual_network" "vmss_vnet" {
  name                = var.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = module.rg.rg_name
  tags                = var.tags
}

resource "azurerm_subnet" "vmss_subnets" {
  for_each             = var.subnet_names
  name                 = each.key
  resource_group_name  = module.rg.rg_name
  virtual_network_name = azurerm_virtual_network.vmss_vnet.name
  address_prefixes     = ["10.0.${each.value}.0/24"]
}

resource "azurerm_public_ip" "vmss_public_ip" {
  name                = var.vmss_public_ip_name
  location            = var.location
  resource_group_name = module.rg.rg_name
  allocation_method   = "Static"
  tags                = var.tags
  domain_name_label   = "lbdomainname"
}

resource "azurerm_lb" "vmss_load_balancer" {
  name                = var.load_balancer_name
  location            = var.location
  resource_group_name = module.rg.rg_name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.vmss_public_ip.id
  }

  tags = var.tags
}

resource "azurerm_lb_backend_address_pool" "backend_address_pool" {
  loadbalancer_id = azurerm_lb.vmss_load_balancer.id
  name            = "BackEndAddressPool"
}

resource "azurerm_lb_probe" "vmss_probe" {
  resource_group_name = module.rg.rg_name
  loadbalancer_id     = azurerm_lb.vmss_load_balancer.id
  name                = "ssh-probe"
  port                = var.application_port
}

resource "azurerm_lb_rule" "lbnatrule" {
  resource_group_name            = module.rg.rg_name
  loadbalancer_id                = azurerm_lb.vmss_load_balancer.id
  name                           = "http"
  protocol                       = "Tcp"
  frontend_port                  = var.application_port
  backend_port                   = var.application_port
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.backend_address_pool.id]
  frontend_ip_configuration_name = "PublicIPAddress"
  probe_id                       = azurerm_lb_probe.vmss_probe.id
}

resource "azurerm_virtual_machine_scale_set" "vmss" {
  name                = var.vmss_name
  location            = var.location
  resource_group_name = module.rg.rg_name
  upgrade_policy_mode = "Manual"

  sku {
    name     = "Standard_DS1_v2"
    tier     = "Standard"
    capacity = 2
  }

  storage_profile_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_profile_os_disk {
    name              = ""
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_profile_data_disk {
    lun           = 0
    caching       = "ReadWrite"
    create_option = "Empty"
    disk_size_gb  = 10
  }

  os_profile {
    computer_name_prefix = "vmlab"
    admin_username       = var.admin_user
    admin_password       = var.admin_password
    custom_data          = file("web.conf")
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  network_profile {
    name    = "terraformnetworkprofile"
    primary = true

    ip_configuration {
      name                                   = "IPConfiguration"
      subnet_id                              = azurerm_subnet.vmss_subnets["AppSubnet"].id
      load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.backend_address_pool.id]
      primary                                = true
    }
  }

  tags = var.tags
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
