# terraform-hcloud-infrastructure

Reusable Terraform modules for managing Hetzner Cloud resources.

## Available Modules

| Module | Description |
|--------|-------------|
| [firewall](./modules/firewall.md) | Create and manage Hetzner Cloud firewalls with dynamic rule sets |
| [server](./modules/server.md) | Provision Hetzner Cloud servers with SSH keys and firewall integration |
| [ssh-keys](./modules/ssh-keys.md) | Generate SSH key pairs and register them in Hetzner Cloud |

## Requirements

- Terraform >= 1.0
- [Hetzner Cloud Provider](https://registry.terraform.io/providers/hetznercloud/hcloud/latest) ~> 1.45
