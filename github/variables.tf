variable "ssh_key" {
  type        = string
  description = "The public SSH key to add to the GitHub account."
}

variable "gpg_key_id" {
  type        = string
  description = "The ID of the GPG key to add to the GitHub account."
}
