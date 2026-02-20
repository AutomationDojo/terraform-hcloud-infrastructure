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
| [hcloud_firewall.this](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/firewall) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_labels"></a> [labels](#input\_labels) | Labels to apply to all firewalls. | `map(string)` | `{}` | no |
| <a name="input_rules"></a> [rules](#input\_rules) | Map of firewall rule sets. Each key creates a firewall, and its value is a list of rule objects. | <pre>map(list(object({<br/>    direction  = string<br/>    protocol   = string<br/>    port       = string<br/>    source_ips = list(string)<br/>  })))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_firewall_ids"></a> [firewall\_ids](#output\_firewall\_ids) | Map of firewall name to Hetzner Cloud firewall ID. |
<!-- END_TF_DOCS -->