# SSH Keys Module

Generates RSA-4096 SSH key pairs and registers them in Hetzner Cloud. Supports two modes: auto-generation and SOPS-managed pre-existing keys.

## Usage

=== "Generate Keys"

    ```hcl
    module "ssh_keys" {
      source  = "AutomationDojo/infrastructure/hcloud//modules/ssh-keys"
      version = "1.3.1"

      # Required
      servers = ["web-1", "web-2"]

      generate_keys = true             # optional
      output_path   = "${path.root}/keys" # optional
      sops_keys     = {}               # optional
    }
    ```

    When `output_path` is set, key files are written to `<output_path>/<server>/keys/`.

=== "SOPS Keys"

    ```hcl
    data "sops_file" "ssh" {
      source_file = "secrets/ssh.enc.yaml"
    }

    module "ssh_keys" {
      source  = "AutomationDojo/infrastructure/hcloud//modules/ssh-keys"
      version = "1.3.1"

      # Required
      servers = ["web-1", "web-2"]

      generate_keys = false # optional
      sops_keys = {         # optional
        web-1 = data.sops_file.ssh.data["web_1_public_key"]
        web-2 = data.sops_file.ssh.data["web_2_public_key"]
      }
      output_path = "" # optional
    }
    ```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `servers` | List of server names to create SSH keys for. | `list(string)` | n/a | yes |
| `generate_keys` | When `true`, SSH key pairs are generated. When `false`, provide keys via `sops_keys`. | `bool` | `true` | no |
| `sops_keys` | Map of server name to public key string. Used when `generate_keys` is `false`. | `map(string)` | `{}` | no |
| `output_path` | Base directory to write SSH key files. Leave empty to skip. Only applies when `generate_keys` is `true`. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| `ssh_key_ids` | Map of server name to Hetzner Cloud SSH key ID. |
| `ssh_key_names` | Map of server name to SSH key name. |

## Resources

| Name | Type |
|------|------|
| `tls_private_key.generic-ssh-key` | resource |
| `hcloud_ssh_key.generated` | resource |
| `hcloud_ssh_key.sops` | resource |
| `local_file.ssh_key_private` | resource |
| `local_file.ssh_key_public` | resource |

!!! warning
    When using `output_path`, the private key is stored in plaintext on disk. Ensure the path is excluded from version control.
