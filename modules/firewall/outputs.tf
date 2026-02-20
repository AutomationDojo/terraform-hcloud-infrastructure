output "firewall_ids" {
  value = {
    for k, v in hcloud_firewall.this : k => v.id
  }
}
