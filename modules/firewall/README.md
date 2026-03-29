<!-- BEGIN_TF_DOCS -->
## Usage

```hcl
module "example" {
  source  = "AutomationDojo/infrastructure/hcloud"
  version = "1.3.0"

  rules  = var.rules

  labels = var.labels # optional
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | `>= 1.0` |
| hcloud | `~> 1.45` |

## Providers

| Name | Version |
|------|---------|
| hcloud | `~> 1.45` |

## Resources

| Name | Type |
|------|------|
| [hcloud_firewall.this](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/firewall) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rules | Map of firewall rule sets. Each key creates a firewall, and its value is a list of rule objects. | `map(list(object({   direction = string   protocol  = string   port    = string   source_ips = list(string)  })))` | n/a | yes |
| labels | Labels to apply to all firewalls. | `map(string)` | `{}` | no |
## Outputs

| Name | Description |
|------|-------------|
| firewall_ids | Map of firewall name to Hetzner Cloud firewall ID. |
<!-- END_TF_DOCS -->