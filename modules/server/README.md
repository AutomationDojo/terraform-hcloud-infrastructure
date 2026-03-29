<!-- BEGIN_TF_DOCS -->
## Usage

```hcl
module "example" {
  source  = "AutomationDojo/infrastructure/hcloud"
  version = "1.3.1"

  servers = var.servers

  labels  = var.labels # optional
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
| [hcloud_server.this](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server) | resource |
| [hcloud_firewall.this](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/data-sources/firewall) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| servers | Map of server configurations to create. Each value should include name, image, server_type, location, and firewall_name. | `any` | n/a | yes |
| labels | Labels to apply to all servers. | `map(string)` | `{}` | no |
## Outputs

| Name | Description |
|------|-------------|
| server_ids | Map of server key to Hetzner Cloud server ID. |
| server_ips | Map of server key to public IPv4 address. |
<!-- END_TF_DOCS -->