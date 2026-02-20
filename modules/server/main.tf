data "hcloud_firewall" "this" {
  for_each = var.servers
  name     = "firewall-${each.value.firewall_name}"
}

resource "hcloud_server" "this" {
  for_each     = var.servers
  name         = each.value.name
  image        = each.value.image
  server_type  = each.value.server_type
  location     = each.value.location
  ssh_keys     = ["${each.value.name}-ssh-key"]
  firewall_ids = [data.hcloud_firewall.this[each.key].id]

  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }

  delete_protection  = true
  rebuild_protection = true

  labels = var.labels
}
