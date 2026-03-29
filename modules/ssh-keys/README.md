<!-- BEGIN_TF_DOCS -->
## Usage

```hcl
module "example" {
  source  = "AutomationDojo/infrastructure/hcloud"
  version = "1.3.1"

  servers       = var.servers

  generate_keys = var.generate_keys # optional
  output_path   = var.output_path # optional
  sops_keys     = var.sops_keys # optional
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
| local | `` |
| tls | `` |

## Resources

| Name | Type |
|------|------|
| [hcloud_ssh_key.generated](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/ssh_key) | resource |
| [hcloud_ssh_key.sops](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/ssh_key) | resource |
| [local_file.ssh_key_private](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [local_file.ssh_key_public](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [tls_private_key.generic-ssh-key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| servers | List of server names to create SSH keys for. | `list(string)` | n/a | yes |
| generate_keys | When true, SSH key pairs are generated. When false, public keys must be provided via the sops_keys variable. | `bool` | `true` | no |
| output_path | Base directory to write SSH key files. When empty, no local files are created. Only applies when generate_keys is true. | `string` | `""` | no |
| sops_keys | Map of server name to public key string. Used when generate_keys is false. | `map(string)` | `{}` | no |
## Outputs

| Name | Description |
|------|-------------|
| ssh_key_ids | Map of server name to Hetzner Cloud SSH key ID. |
| ssh_key_names | Map of server name to SSH key name. |
<!-- END_TF_DOCS -->