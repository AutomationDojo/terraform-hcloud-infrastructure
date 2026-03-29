# Server Module

Provisions Hetzner Cloud servers with SSH key and firewall integration. All servers are created with delete and rebuild protection enabled.

## Usage

```hcl
module "server" {
  source = "AutomationDojo/infrastructure/hcloud//modules/server"

  # Required
  servers = {
    web = {
      name          = "web-1"
      image         = "ubuntu-22.04"
      server_type   = "cx22"
      location      = "fsn1"
      firewall_name = "web"
    }
  }

  labels = {} # optional
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `servers` | Map of server configurations. Each value must include `name`, `image`, `server_type`, `location`, and `firewall_name`. | `any` | n/a | yes |
| `labels` | Labels to apply to all servers. | `map(string)` | `{}` | no |

### Server Configuration Fields

| Field | Description | Example |
|-------|-------------|---------|
| `name` | Server name in Hetzner Cloud | `"web-1"` |
| `image` | OS image | `"ubuntu-22.04"` |
| `server_type` | Server type | `"cx22"` |
| `location` | Datacenter location | `"fsn1"`, `"nbg1"`, `"hel1"` |
| `firewall_name` | Name of the firewall to attach (must match a key in the firewall module) | `"web"` |

## Outputs

| Name | Description |
|------|-------------|
| `server_ids` | Map of server key to Hetzner Cloud server ID. |
| `server_ips` | Map of server key to public IPv4 address. |

## Resources

| Name | Type |
|------|------|
| `hcloud_server.this` | resource |
| `hcloud_firewall.this` | data source |

!!! note
    The server module expects an SSH key named `<server-name>-ssh-key` to exist in Hetzner Cloud. Deploy the `ssh-keys` module first.
