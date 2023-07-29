terragrunt_version_constraint = ">= 0.48.0" # Terraform 1.5.x

remote_state {
  backend = "gcs"

  generate = {
    path      = "terragrunt_backend.tf"
    if_exists = "overwrite_terragrunt"
  }

  config = {
    bucket = "slabstone-plateau"
    prefix = path_relative_to_include()

    project  = "symmetric-fin-394116"
    location = "us-west1"

    enable_bucket_policy_only = true # use uniform bucket-level access
  }
}
