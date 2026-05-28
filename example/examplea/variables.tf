variable "project" {
  type        = string
  description = "GCP project ID."
}

variable "repo" {
  type        = string
  description = "GitHub repository in 'owner/name' format."
}

variable "wif_pool_name" {
  type        = string
  description = "Full resource name of the Workload Identity Pool."
}

variable "permissions" {
  type        = list(string)
  description = "GCP IAM permissions to grant to the service account."
  default     = []
}
