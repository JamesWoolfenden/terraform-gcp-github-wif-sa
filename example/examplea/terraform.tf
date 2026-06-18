# holden:ignore:HLD_TF_004 — examples do not require a remote backend
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.34.0"
    }
  }
  required_version = ">=1.5.0"
}
