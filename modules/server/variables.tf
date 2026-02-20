variable "servers" {
  type = any
}

variable "labels" {
  type    = map(string)
  default = {}
}
