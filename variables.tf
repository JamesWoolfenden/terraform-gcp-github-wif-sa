variable "project" {
  type        = string
  description = "GCP project ID where the service account and IAM bindings are created."
  validation {
    condition     = can(regex("^[a-z][a-z0-9-]{4,28}[a-z0-9]$", var.project))
    error_message = "project must be a valid GCP project ID (6-30 chars, lowercase letters, numbers or hyphens, start with a letter)."
  }
}

variable "repo" {
  type        = string
  description = "GitHub repository in 'owner/name' format (e.g. 'JamesWoolfenden/terraform-gcp-storage')."

  validation {
    condition     = can(regex("^[^/]+/[^/]+$", var.repo))
    error_message = "repo must be in 'owner/name' format."
  }
}

variable "wif_pool_name" {
  type        = string
  description = "Full resource name of the Workload Identity Pool, e.g. projects/PROJECT_NUMBER/locations/global/workloadIdentityPools/POOL_ID."
  validation {
    condition     = length(var.wif_pool_name)> 0
    error_message = "pool name cannot be empty"
  }
}

# holden:ignore:HLD_TF_021
variable "permissions" {
  type        = list(string)
  description = "Exact GCP IAM permissions to grant via a per-repo custom role. Generate with: pike make -d <module-root> -p gcp"
}

variable "description" {
  type        = string
  description =  "human-readable description for the service account."
  validation {
    condition     = length(var.description)> 0
    error_message = "description cannot be empty"
  }
}
