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

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_lb.vmss_load_balancer](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb) | resource |
| [azurerm_lb_backend_address_pool.backend_address_pool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_backend_address_pool) | resource |
| [azurerm_lb_probe.vmss_probe](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_probe) | resource |
| [azurerm_lb_rule.lbnatrule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_rule) | resource |
| [azurerm_mysql_server.mysqlserver](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_server) | resource |
| [azurerm_private_endpoint.name](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_public_ip.vmss_public_ip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_subnet.vmss_subnets](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_traffic_manager_azure_endpoint.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/traffic_manager_azure_endpoint) | resource |
| [azurerm_traffic_manager_profile.traffic_manager_profile](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/traffic_manager_profile) | resource |
| [azurerm_virtual_machine_scale_set.vmss](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_scale_set) | resource |
| [azurerm_virtual_network.vmss_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | Default password for admin account | `any` | n/a | yes |
| <a name="input_admin_user"></a> [admin\_user](#input\_admin\_user) | User name to use as the admin account on the VMs that will be part of the VM scale set | `any` | n/a | yes |
| <a name="input_application_port"></a> [application\_port](#input\_application\_port) | Port that you want to expose to the external load balancer | `any` | n/a | yes |
| <a name="input_load_balancer_name"></a> [load\_balancer\_name](#input\_load\_balancer\_name) | Name of the load balancer to be attached with the VMSS | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location where resources will be created | `any` | n/a | yes |
| <a name="input_mysql_server_name"></a> [mysql\_server\_name](#input\_mysql\_server\_name) | The name of the MySql Server | `string` | n/a | yes |
| <a name="input_mysql_server_private_endpoint_name"></a> [mysql\_server\_private\_endpoint\_name](#input\_mysql\_server\_private\_endpoint\_name) | The name of the private end point for mysql server | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group in which the resources will be created | `any` | n/a | yes |
| <a name="input_subnet_names"></a> [subnet\_names](#input\_subnet\_names) | The names of the subnets to be created within the vnet | `map(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of the tags to use for the resources that are deployed | `map(string)` | <pre>{<br>  "environment": "test"<br>}</pre> | no |
| <a name="input_traffic_manager_endpoint_name"></a> [traffic\_manager\_endpoint\_name](#input\_traffic\_manager\_endpoint\_name) | The name of the traffic manager endpoint | `string` | n/a | yes |
| <a name="input_traffic_manager_profile_name"></a> [traffic\_manager\_profile\_name](#input\_traffic\_manager\_profile\_name) | The name of the traffic manager profile which is to be attached with traffic manager endpoint | `string` | n/a | yes |
| <a name="input_vmss_name"></a> [vmss\_name](#input\_vmss\_name) | The name fo the VMSS to be created! | `string` | n/a | yes |
| <a name="input_vmss_public_ip_name"></a> [vmss\_public\_ip\_name](#input\_vmss\_public\_ip\_name) | Name of the public IP to be attached with the VM Scale Set | `string` | n/a | yes |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | Name of the Vnet which is created! | `any` | n/a | yes |

## Outputs

No outputs.
