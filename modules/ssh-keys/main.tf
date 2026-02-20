resource "tls_private_key" "generic-ssh-key" {
  for_each  = var.generate_keys ? toset(var.servers) : toset([])
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "hcloud_ssh_key" "generated" {
  for_each   = var.generate_keys ? toset(var.servers) : toset([])
  name       = "${each.key}-ssh-key"
  public_key = tls_private_key.generic-ssh-key[each.key].public_key_openssh
}

resource "hcloud_ssh_key" "sops" {
  for_each   = var.generate_keys ? {} : var.sops_keys
  name       = "${each.key}-ssh-key"
  public_key = each.value
}

resource "local_file" "ssh_key_private" {
  for_each = var.generate_keys && var.output_path != "" ? toset(var.servers) : toset([])
  content  = tls_private_key.generic-ssh-key[each.key].private_key_pem
  filename = "${var.output_path}/${each.key}/keys/${each.key}-ssh-key.pem"
}

resource "local_file" "ssh_key_public" {
  for_each = var.generate_keys && var.output_path != "" ? toset(var.servers) : toset([])
  content  = tls_private_key.generic-ssh-key[each.key].public_key_openssh
  filename = "${var.output_path}/${each.key}/keys/${each.key}-ssh-key.pub"
}
