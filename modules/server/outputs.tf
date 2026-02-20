output "server_ids" {
  description = "Map of server key to Hetzner Cloud server ID."
  value = {
    for k, v in hcloud_server.this : k => v.id
  }
}

output "server_ips" {
  description = "Map of server key to public IPv4 address."
  value = {
    for k, v in hcloud_server.this : k => v.ipv4_address
  }
}
