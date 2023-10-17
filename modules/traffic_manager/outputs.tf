output "profile" {
  value = azurerm_traffic_manager_profile.traffic_manager_profile
}

output "endpoint" {
  value = azurerm_traffic_manager_azure_endpoint.tm_endpoint
}