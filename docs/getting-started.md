# Getting Started

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) >= 1.0
- A [Hetzner Cloud](https://www.hetzner.com/cloud) account and API token

## Authentication

Set your Hetzner Cloud API token as an environment variable:

```bash
export HCLOUD_TOKEN="your-api-token"
```

Or pass it directly in your Terraform configuration:

```hcl
provider "hcloud" {
  token = var.hcloud_token
}
```

## Basic Example

A minimal setup with SSH keys, a firewall, and a server:

```hcl
module "ssh_keys" {
  source = "AutomationDojo/infrastructure/hcloud//modules/ssh-keys"

  servers     = ["web-1"]
  output_path = "${path.root}/keys"
}

module "firewall" {
  source = "AutomationDojo/infrastructure/hcloud//modules/firewall"

  rules = {
    web = [
      {
        direction  = "in"
        protocol   = "tcp"
        port       = "22"
        source_ips = ["0.0.0.0/0", "::/0"]
      },
      {
        direction  = "in"
        protocol   = "tcp"
        port       = "80"
        source_ips = ["0.0.0.0/0", "::/0"]
      }
    ]
  }
}

module "server" {
  source = "AutomationDojo/infrastructure/hcloud//modules/server"

  servers = {
    web = {
      name          = "web-1"
      image         = "ubuntu-22.04"
      server_type   = "cx22"
      location      = "fsn1"
      firewall_name = "web"
    }
  }
}
```

## Module Order

The modules have implicit dependencies — deploy them in this order:

1. **ssh-keys** — registers SSH keys in Hetzner Cloud
2. **firewall** — creates firewall rules
3. **server** — provisions servers, referencing the SSH key and firewall names
