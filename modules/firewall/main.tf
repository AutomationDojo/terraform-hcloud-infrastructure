resource "hcloud_firewall" "this" {
  for_each = var.rules

  name = "firewall-${each.key}"

  dynamic "rule" {
    for_each = each.value
    content {
      direction  = rule.value.direction
      protocol   = rule.value.protocol
      port       = rule.value.port
      source_ips = rule.value.source_ips
    }
  }

  labels = var.labels
}
