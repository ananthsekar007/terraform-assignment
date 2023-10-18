## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_lb.vmss_load_balancer](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb) | resource |
| [azurerm_lb_backend_address_pool.backend_address_pool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_backend_address_pool) | resource |
| [azurerm_lb_probe.vmss_probe](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_probe) | resource |
| [azurerm_lb_rule.lbnatrule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_port"></a> [application\_port](#input\_application\_port) | Port that you want to expose to the external load balancer | `string` | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | The common tags across all resources | `map(any)` | n/a | yes |
| <a name="input_load_balancer_name"></a> [load\_balancer\_name](#input\_load\_balancer\_name) | Name of the load balancer to be attached with the VMSS | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location where resources will be created | `string` | n/a | yes |
| <a name="input_public_ip_id"></a> [public\_ip\_id](#input\_public\_ip\_id) | The ID of the public ip that is to be linked with load balancer | `string` | n/a | yes |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | The name of the resource group | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lb_backend_address_pool"></a> [lb\_backend\_address\_pool](#output\_lb\_backend\_address\_pool) | n/a |
| <a name="output_lb_probe"></a> [lb\_probe](#output\_lb\_probe) | n/a |
| <a name="output_load_balancer"></a> [load\_balancer](#output\_load\_balancer) | n/a |
| <a name="output_nat_rule"></a> [nat\_rule](#output\_nat\_rule) | n/a |
