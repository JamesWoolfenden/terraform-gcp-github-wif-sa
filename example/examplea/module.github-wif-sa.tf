# holden:ignore:HLD_TF_026 — examples intentionally use ../../ to reference the local module root
module "github_wif_sa" {
  source = "../../"

  project       = var.project
  repo          = var.repo
  wif_pool_name = var.wif_pool_name
  permissions   = var.permissions
  description ="description for the wif pool"
}
