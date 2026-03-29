# Firewall Module

Creates and manages Hetzner Cloud firewalls with dynamic rule sets. Each key in the `rules` map creates a separate firewall.

## Usage

```hcl
module "firewall" {
  source  = "AutomationDojo/infrastructure/hcloud//modules/firewall"
  version = "1.3.1"

  # Required
  rules = {
    web = [
      {
        direction  = "in"
        protocol   = "tcp"
        port       = "80"
        source_ips = ["0.0.0.0/0", "::/0"]
      },
      {
        direction  = "in"
        protocol   = "tcp"
        port       = "443"
        source_ips = ["0.0.0.0/0", "::/0"]
      }
    ]
  }

  labels = {} # optional
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `rules` | Map of firewall rule sets. Each key creates a firewall, and its value is a list of rule objects. | `map(list(object({direction, protocol, port, source_ips})))` | n/a | yes |
| `labels` | Labels to apply to all firewalls. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| `firewall_ids` | Map of firewall name to Hetzner Cloud firewall ID. |

## Resources

| Name | Type |
|------|------|
| `hcloud_firewall.this` | resource |
