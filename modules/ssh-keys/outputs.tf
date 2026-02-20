output "ssh_key_ids" {
  description = "Map of server name to Hetzner Cloud SSH key ID."
  value = var.generate_keys ? {
    for k, v in hcloud_ssh_key.generated : k => v.id
    } : {
    for k, v in hcloud_ssh_key.sops : k => v.id
  }
}

output "ssh_key_names" {
  description = "Map of server name to SSH key name."
  value = var.generate_keys ? {
    for k, v in hcloud_ssh_key.generated : k => v.name
    } : {
    for k, v in hcloud_ssh_key.sops : k => v.name
  }
}
