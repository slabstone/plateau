variable "ssh_key" {
  type        = string
  description = "The public SSH key to add to the GitHub account."
}

variable "gpg_key_id" {
  type        = string
  description = "The ID of the GPG key to add to the GitHub account."

  validation {
    condition     = can(regex("^[0-9A-F]{8,40}$", var.gpg_key_id))
    error_message = "gpg_key_id must be a valid GPG key ID."
  }
}
