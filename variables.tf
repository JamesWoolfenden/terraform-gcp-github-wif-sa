variable "project" {
  type        = string
  description = "GCP project ID where the service account and IAM bindings are created."
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
}

variable "permissions" {
  type        = list(string)
  description = "Exact GCP IAM permissions to grant via a per-repo custom role. Generate with: pike make -d <module-root> -p gcp"
  default     = []
}

variable "description" {
  type        = string
  description = "Optional human-readable description for the service account."
  default     = ""
}
