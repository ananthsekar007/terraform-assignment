output "sql" {
  value = azurerm_mysql_flexible_server.sql_server
}

output "endpoint" {
  value = azurerm_private_endpoint.private_endpoint
}