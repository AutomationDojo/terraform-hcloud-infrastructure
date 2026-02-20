variable "rules" {
  description = "Map of firewall rule sets. Each key creates a firewall, and its value is a list of rule objects."
  type = map(list(object({
    direction  = string
    protocol   = string
    port       = string
    source_ips = list(string)
  })))
}

variable "labels" {
  description = "Labels to apply to all firewalls."
  type        = map(string)
  default     = {}
}
