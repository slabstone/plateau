terraform {
  required_version = "~> 1.5"

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.32"
    }

    external = {
      source  = "hashicorp/external"
      version = "~> 2.3"
    }
  }
}
