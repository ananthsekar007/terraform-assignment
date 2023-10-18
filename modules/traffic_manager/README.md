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
| [azurerm_traffic_manager_azure_endpoint.tm_endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/traffic_manager_azure_endpoint) | resource |
| [azurerm_traffic_manager_profile.traffic_manager_profile](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/traffic_manager_profile) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_port"></a> [application\_port](#input\_application\_port) | The port in which the traffic manager should be linked | `number` | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | The common tags across all resources | `map(any)` | n/a | yes |
| <a name="input_public_ip_id"></a> [public\_ip\_id](#input\_public\_ip\_id) | The ID of the public IP | `string` | n/a | yes |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | The name of the resource group | `string` | n/a | yes |
| <a name="input_traffic_manager_endpoint_name"></a> [traffic\_manager\_endpoint\_name](#input\_traffic\_manager\_endpoint\_name) | The name of the traffic manager endpoint | `string` | n/a | yes |
| <a name="input_traffic_manager_profile_name"></a> [traffic\_manager\_profile\_name](#input\_traffic\_manager\_profile\_name) | The name of the traffic manager profile | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | n/a |
| <a name="output_profile"></a> [profile](#output\_profile) | n/a |
