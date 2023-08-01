locals {
  gpg_armored_key_regex = join("", [
    "^-----BEGIN PGP PUBLIC KEY BLOCK-----",
    "[\\s\\w+/=]+",
    "-----END PGP PUBLIC KEY BLOCK-----$",
  ])
}

resource "github_user_ssh_key" "main" {
  title = data.github_user.current.login
  key   = var.ssh_key
}

data "external" "gpg" {
  program = ["${path.module}/files/gpg-armored-key"]
  query = {
    key_id = var.gpg_key_id
  }

  lifecycle {
    postcondition {
      condition     = can(regex(local.gpg_armored_key_regex, self.result.armored_key))
      error_message = "Failed to get armored key from key ${var.gpg_key_id}."
    }
  }
}

resource "github_user_gpg_key" "main" {
  armored_public_key = data.external.gpg.result.armored_key
}
