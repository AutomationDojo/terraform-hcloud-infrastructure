variable "servers" {
  description = "List of server names to generate SSH key pairs for."
  type        = list(string)
}

variable "output_path" {
  description = "Base directory to write SSH key files. When empty, no local files are created."
  type        = string
  default     = ""
}
