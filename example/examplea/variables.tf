variable "project" {
  type        = string
  description = "GCP project ID."
  validation {
    condition     = length(var.project) >= 6 && length(var.project) <= 30 && can(regex("^[a-z][a-z0-9-]*[a-z0-9]$", var.project))
    error_message = "The project ID must be 6-30 characters, start with a lowercase letter, contain only lowercase letters, digits or hyphens, and end with a letter or digit."
  }
}

variable "repo" {
  type        = string
  description = "GitHub repository in 'owner/name' format."
  validation {
    condition     = can(regex("^[a-zA-Z0-9-]+/[a-zA-Z0-9._-]+$", var.repo)) && length(var.repo) > 0
    error_message = "The repo must be in the form 'owner/name' (owner: letters, digits or hyphens; name: letters, digits, dots, underscores or hyphens)."
  }
}

variable "wif_pool_name" {
  type        = string
  description = "Full resource name of the Workload Identity Pool."
  validation {
    condition     = length(var.wif_pool_name) > 0 && can(regex("^projects/[a-z0-9-]+/locations/[a-z0-9-]+/workloadIdentityPools/[a-z0-9-_]+$", var.wif_pool_name))
    error_message = "The wif_pool_name must be a valid Workload Identity Pool resource name in the format: projects/{project}/locations/{location}/workloadIdentityPools/{pool_name}."
  }
}

# holden:ignore:HLD_TF_021
variable "permissions" {
  type        = list(string)
  description = "GCP IAM permissions to grant to the service account."
  default     = []
}
