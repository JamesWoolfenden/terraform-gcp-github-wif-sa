resource "google_service_account" "sa" {
  project      = var.project
  account_id   = local.sa_id
  display_name = local.sa_display
}

