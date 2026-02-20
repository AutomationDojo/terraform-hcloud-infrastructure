output "firewall_ids" {
  description = "Map of firewall name to Hetzner Cloud firewall ID."
  value = {
    for k, v in hcloud_firewall.this : k => v.id
  }
}
