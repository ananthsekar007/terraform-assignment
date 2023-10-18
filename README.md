## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.12 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 2.99.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_compute"></a> [compute](#module\_compute) | ./modules/compute/linux_vmss | n/a |
| <a name="module_load_balancing"></a> [load\_balancing](#module\_load\_balancing) | ./modules/balancers | n/a |
| <a name="module_networking"></a> [networking](#module\_networking) | ./modules/networking | n/a |
| <a name="module_secondary_networking"></a> [secondary\_networking](#module\_secondary\_networking) | ./modules/networking | n/a |
| <a name="module_secondary_server"></a> [secondary\_server](#module\_secondary\_server) | ./modules/db_server/mysql | n/a |
| <a name="module_server"></a> [server](#module\_server) | ./modules/db_server/mysql | n/a |
| <a name="module_traffic_manager"></a> [traffic\_manager](#module\_traffic\_manager) | ./modules/traffic_manager | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_mysql_flexible_server.restore_sql_server](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_flexible_server) | resource |
| [azurerm_private_endpoint.private_endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_public_ip.vmss_public_ip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | Default password for admin account | `string` | n/a | yes |
| <a name="input_admin_user"></a> [admin\_user](#input\_admin\_user) | User name to use as the admin account on the VMs that will be part of the VM scale set | `string` | n/a | yes |
| <a name="input_application_port"></a> [application\_port](#input\_application\_port) | Port that you want to expose to the external load balancer | `string` | n/a | yes |
| <a name="input_load_balancer_name"></a> [load\_balancer\_name](#input\_load\_balancer\_name) | Name of the load balancer to be attached with the VMSS | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location where resources will be created | `string` | n/a | yes |
| <a name="input_mysql_database_name"></a> [mysql\_database\_name](#input\_mysql\_database\_name) | Tha name of the MySql database | `string` | n/a | yes |
| <a name="input_mysql_server_name"></a> [mysql\_server\_name](#input\_mysql\_server\_name) | The name of the MySql Server | `string` | n/a | yes |
| <a name="input_mysql_server_private_endpoint_name"></a> [mysql\_server\_private\_endpoint\_name](#input\_mysql\_server\_private\_endpoint\_name) | The name of the private endpoint | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group in which the resources will be created | `string` | n/a | yes |
| <a name="input_restore_server_name"></a> [restore\_server\_name](#input\_restore\_server\_name) | The name of the restore server | `string` | n/a | yes |
| <a name="input_restore_sku_name"></a> [restore\_sku\_name](#input\_restore\_sku\_name) | SKU of the restore server | `string` | n/a | yes |
| <a name="input_secondary_location"></a> [secondary\_location](#input\_secondary\_location) | Secondary Location where resources will be created | `string` | n/a | yes |
| <a name="input_secondary_mysql_server_name"></a> [secondary\_mysql\_server\_name](#input\_secondary\_mysql\_server\_name) | The name of the secondary MySql server | `string` | n/a | yes |
| <a name="input_secondary_subnet_names"></a> [secondary\_subnet\_names](#input\_secondary\_subnet\_names) | The names of the secondary subnets to be created within the secondary vnet | `map(string)` | n/a | yes |
| <a name="input_secondary_vnet_address"></a> [secondary\_vnet\_address](#input\_secondary\_vnet\_address) | The value of the secondary cidr block | `string` | n/a | yes |
| <a name="input_secondary_vnet_name"></a> [secondary\_vnet\_name](#input\_secondary\_vnet\_name) | Name of the secondary vnet created | `string` | n/a | yes |
| <a name="input_subnet_names"></a> [subnet\_names](#input\_subnet\_names) | The names of the subnets to be created within the vnet | `map(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of the tags to use for the resources that are deployed | `map(string)` | <pre>{<br>  "environment": "test"<br>}</pre> | no |
| <a name="input_traffic_manager_endpoint_name"></a> [traffic\_manager\_endpoint\_name](#input\_traffic\_manager\_endpoint\_name) | The name of the traffic manager endpoint | `string` | n/a | yes |
| <a name="input_traffic_manager_profile_name"></a> [traffic\_manager\_profile\_name](#input\_traffic\_manager\_profile\_name) | The name of the traffic manager profile which is to be attached with traffic manager endpoint | `string` | n/a | yes |
| <a name="input_vmss_name"></a> [vmss\_name](#input\_vmss\_name) | The name fo the VMSS to be created! | `string` | n/a | yes |
| <a name="input_vmss_public_ip_name"></a> [vmss\_public\_ip\_name](#input\_vmss\_public\_ip\_name) | Name of the public IP to be attached with the VM Scale Set | `string` | n/a | yes |
| <a name="input_vnet_address"></a> [vnet\_address](#input\_vnet\_address) | The value of the cidr block | `string` | n/a | yes |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | Name of the Vnet which is created! | `string` | n/a | yes |

## Outputs

No outputs.
