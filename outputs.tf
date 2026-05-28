output "email" {
  value       = google_service_account.sa.email
  description = "Service account email — pass this as the service_account input to the reusable GCP workflow."
}

output "name" {
  value       = google_service_account.sa.name
  description = "Fully-qualified service account resource name."
}
