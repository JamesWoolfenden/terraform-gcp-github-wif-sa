output "email" {
  value       = module.github_wif_sa.email
  description = "Service account email."
}

output "name" {
  value       = module.github_wif_sa.name
  description = "Fully-qualified service account resource name."
}
