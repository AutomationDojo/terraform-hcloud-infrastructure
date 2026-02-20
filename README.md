# hetzner-tf-module

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
  source = "github.com/user-cube/hetzner-tf-module//modules/firewall"

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
  source = "github.com/user-cube/hetzner-tf-module//modules/server"

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

### SSH Keys

```hcl
module "ssh_keys" {
  source = "github.com/user-cube/hetzner-tf-module//modules/ssh-keys"

  servers     = ["web-1", "web-2"]
  output_path = "${path.root}/keys"
}
```

When `output_path` is set, private and public key files are written to `<output_path>/<server>/keys/`. Leave it empty (default) to skip local file output.

## License

See [LICENSE](./LICENSE).

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
