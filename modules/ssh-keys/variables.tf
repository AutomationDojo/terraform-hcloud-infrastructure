variable "servers" {
  description = "List of server names to create SSH keys for."
  type        = list(string)
}

variable "generate_keys" {
  description = "When true, SSH key pairs are generated. When false, public keys must be provided via the sops_keys variable."
  type        = bool
  default     = true
}

variable "sops_keys" {
  description = "Map of server name to public key string. Used when generate_keys is false."
  type        = map(string)
  default     = {}
}

variable "output_path" {
  description = "Base directory to write SSH key files. When empty, no local files are created. Only applies when generate_keys is true."
  type        = string
  default     = ""
}
