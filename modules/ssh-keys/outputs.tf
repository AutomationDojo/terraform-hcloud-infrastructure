output "ssh_key_ids" {
  description = "Map of server name to Hetzner Cloud SSH key ID."
  value = {
    for k, v in hcloud_ssh_key.primary-ssh-key : k => v.id
  }
}

output "ssh_key_names" {
  description = "Map of server name to SSH key name."
  value = {
    for k, v in hcloud_ssh_key.primary-ssh-key : k => v.name
  }
}
