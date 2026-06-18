locals {
  repo_name  = split("/", var.repo)[1]
  sa_id_raw  = lower(replace(local.repo_name, "_", "-"))
  sa_id      = substr(local.sa_id_raw, 0, 30)
  sa_display = var.description != "" ? var.description : "GitHub Actions — ${var.repo}"

  # Custom role ID: derived from repo name, valid chars only, max 64 chars.
  role_id = substr(replace(replace(local.repo_name, "-", "_"), ".", "_"), 0, 64)
}
