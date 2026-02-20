<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | ~> 1.45 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | ~> 1.45 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [hcloud_server.this](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server) | resource |
| [hcloud_firewall.this](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/data-sources/firewall) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_labels"></a> [labels](#input\_labels) | Labels to apply to all servers. | `map(string)` | `{}` | no |
| <a name="input_servers"></a> [servers](#input\_servers) | Map of server configurations to create. Each value should include name, image, server\_type, location, and firewall\_name. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_server_ids"></a> [server\_ids](#output\_server\_ids) | Map of server key to Hetzner Cloud server ID. |
| <a name="output_server_ips"></a> [server\_ips](#output\_server\_ips) | Map of server key to public IPv4 address. |
<!-- END_TF_DOCS -->