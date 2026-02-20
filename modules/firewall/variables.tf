variable "rules" {
  type = map(list(object({
    direction  = string
    protocol   = string
    port       = string
    source_ips = list(string)
  })))
}

variable "labels" {
  type    = map(string)
  default = {}
}
