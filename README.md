# terraform-hcloud-infrastructure

Reusable Terraform modules for managing Hetzner Cloud resources.

## Available Modules

| Module | Description |
|--------|-------------|
| [firewall](./modules/firewall) | Create and manage Hetzner Cloud firewalls with dynamic rule sets |
| [server](./modules/server) | Provision Hetzner Cloud servers with SSH keys and firewall integration |
| [ssh-keys](./modules/ssh-keys) | Generate SSH key pairs and register them in Hetzner Cloud |

## Requirements

- Terraform >= 1.0
- [Hetzner Cloud Provider](https://registry.terraform.io/providers/hetznercloud/hcloud/latest) ~> 1.45

## Usage

### Firewall

```hcl
module "firewall" {
  source  = "AutomationDojo/infrastructure/hcloud//modules/firewall"
  version = "1.3.1"

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

  labels = {
    environment = "production"
  }
}
```

### Server

```hcl
module "server" {
  source  = "AutomationDojo/infrastructure/hcloud//modules/server"
  version = "1.3.1"

  servers = {
    web = {
      name          = "web-1"
      image         = "ubuntu-22.04"
      server_type   = "cx22"
      location      = "fsn1"
      firewall_name = "web"
    }
  }

  labels = {
    environment = "production"
  }
}
```

### SSH Keys (generate)

```hcl
module "ssh_keys" {
  source  = "AutomationDojo/infrastructure/hcloud//modules/ssh-keys"
  version = "1.3.1"

  servers     = ["web-1", "web-2"]
  output_path = "${path.root}/keys"
}
```

When `output_path` is set, private and public key files are written to `<output_path>/<server>/keys/`. Leave it empty (default) to skip local file output.

### SSH Keys (SOPS)

```hcl
data "sops_file" "ssh" {
  source_file = "secrets/ssh.enc.yaml"
}

module "ssh_keys" {
  source  = "AutomationDojo/infrastructure/hcloud//modules/ssh-keys"
  version = "1.3.1"

  servers       = ["web-1", "web-2"]
  generate_keys = false
  sops_keys = {
    web-1 = data.sops_file.ssh.data["web_1_public_key"]
    web-2 = data.sops_file.ssh.data["web_2_public_key"]
  }
}
```

Set `generate_keys = false` and provide public keys via `sops_keys` to use pre-existing keys instead of generating new ones.

## License

See [LICENSE](./LICENSE).

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
