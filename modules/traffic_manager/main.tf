resource "azurerm_traffic_manager_profile" "traffic_manager_profile" {
  name                   = var.traffic_manager_profile_name
  resource_group_name    = var.rg_name
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

  tags = var.common_tags
}

resource "azurerm_traffic_manager_azure_endpoint" "tm_endpoint" {
  name               = var.traffic_manager_endpoint_name
  profile_id         = azurerm_traffic_manager_profile.traffic_manager_profile.id
  weight             = 100
  target_resource_id = var.public_ip_id
}