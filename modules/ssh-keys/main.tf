resource "tls_private_key" "generic-ssh-key" {
  for_each  = toset(var.servers)
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "hcloud_ssh_key" "primary-ssh-key" {
  for_each   = toset(var.servers)
  name       = "${each.key}-ssh-key"
  public_key = tls_private_key.generic-ssh-key[each.key].public_key_openssh
}

resource "local_file" "ssh_key_private" {
  for_each = toset(var.servers)
  content  = tls_private_key.generic-ssh-key[each.key].private_key_pem
  filename = "${path.root}/../../ansible/${each.key}/keys/${each.key}-ssh-key.pem"
}

resource "local_file" "ssh_key_public" {
  for_each = toset(var.servers)
  content  = tls_private_key.generic-ssh-key[each.key].public_key_openssh
  filename = "${path.root}/../../ansible/${each.key}/keys/${each.key}-ssh-key.pub"
}
