include "root" {
  path   = find_in_parent_folders()
  expose = true
}

# generate resource for Terragrunt-created bucket
generate "backend_bucket" {
  path      = "${include.root.locals.filename_prefix}_backend_bucket.tf"
  if_exists = "overwrite_terragrunt"

  contents = <<-EOF
    resource "google_storage_bucket" "backend" {
      name                        = "${include.root.remote_state.config.bucket}"
      location                    = "${include.root.remote_state.config.location}"
      uniform_bucket_level_access = ${include.root.remote_state.config.enable_bucket_policy_only}
    }
  EOF
}
