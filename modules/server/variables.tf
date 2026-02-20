variable "servers" {
  description = "Map of server configurations to create. Each value should include name, image, server_type, location, and firewall_name."
  type        = any
}

variable "labels" {
  description = "Labels to apply to all servers."
  type        = map(string)
  default     = {}
}
