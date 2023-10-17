resource "azurerm_mysql_flexible_server" "sql_server" {
  name = var.server_name
  location = var.location
  resource_group_name = var.rg_name
  administrator_login = var.admin_user
  administrator_password = var.admin_password
  sku_name = var.sku_name
  storage {
    iops    = 360
    size_gb = 20
  }
  zone = var.zone
}

resource "azurerm_private_endpoint" "private_endpoint" {
  name                = var.private_endpoint_name
  location            = module.rg.rg_location
  resource_group_name = module.rg.rg_name
  subnet_id           = var.subnet_id
  private_service_connection {
    name                           = "privateconnection"
    subresource_names              = [ var.server_name ]
    is_manual_connection           = false
    private_connection_resource_id = azurerm_mysql_flexible_server.sql_server.id
  }
}