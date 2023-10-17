resource_group_name = "ananth-group"
admin_user          = "azureuser"
application_port    = 80
location            = "eastus"
admin_password      = "Ananth@123"
vnet_name           = "vmss_vnet"
subnet_names = {
  "AppSubnet" : 1,
  "DbSubnet" : 2
}
vmss_public_ip_name                = "vmss-public-ip"
load_balancer_name                 = "vmss-lb"
vmss_name                          = "vmscaleset"
traffic_manager_profile_name       = "trafficmanagerforlb"
traffic_manager_endpoint_name      = "trafficendpointforlb"
mysql_server_name                  = "mysqlserver01"
mysql_database_name = "mysqldb"
mysql_server_private_endpoint_name = "mysql_private_endpoint"