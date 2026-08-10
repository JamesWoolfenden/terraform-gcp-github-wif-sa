# terraform-gcp-github-wif-sa

[![Build Status](https://github.com/JamesWoolfenden/terraform-gcp-github-wif-sa//workflows/Verify/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-gcp-github-wif-sa)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-gcp-github-wif-sa.svg)](https://github.com/JamesWoolfenden/terraform-gcp-github-wif-sa/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-gcp-github-wif-sa.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-gcp-github-wif-sa/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)

Terraform module to create a GCP service account and Workload Identity Federation
binding for a GitHub Actions repository, with an optional per-repo least-privilege
custom IAM role.

Each repository gets its own service account scoped to that repository only — no
long-lived key files, no shared credentials.

---

It's 100% Open Source and licensed under the [APACHE2](LICENSE).

## Usage

Include this repository as a module in your existing Terraform code:

```hcl
module "github_wif_sa" {
  source  = "JamesWoolfenden/github-wif-sa/gcp"
  version = "0.1.0"

  project       = "my-gcp-project"
  repo          = "JamesWoolfenden/my-repo"
  wif_pool_name = "projects/123456789/locations/global/workloadIdentityPools/github"

  permissions = [
    "storage.buckets.get",
    "storage.objects.create",
  ]
}
```

The service account email is available as `module.github_wif_sa.email` and should
be passed to the reusable GCP workflow as the `service_account` input.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [google_project_iam_custom_role.ci_permissions](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_custom_role) | resource |
| [google_project_iam_member.custom_role](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_service_account.sa](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account_iam_binding.wif](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_iam_binding) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_description"></a> [description](#input\_description) | human-readable description for the service account. | `string` | n/a | yes |
| <a name="input_permissions"></a> [permissions](#input\_permissions) | Exact GCP IAM permissions to grant via a per-repo custom role. Generate with: pike make -d `<module-root>` -p gcp | `list(string)` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | GCP project ID where the service account and IAM bindings are created. | `string` | n/a | yes |
| <a name="input_repo"></a> [repo](#input\_repo) | GitHub repository in 'owner/name' format (e.g. 'JamesWoolfenden/terraform-gcp-storage'). | `string` | n/a | yes |
| <a name="input_wif_pool_name"></a> [wif\_pool\_name](#input\_wif\_pool\_name) | Full resource name of the Workload Identity Pool, e.g. projects/PROJECT\_NUMBER/locations/global/workloadIdentityPools/POOL\_ID. | `string` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_email"></a> [email](#output\_email) | Service account email — pass this as the service\_account input to the reusable GCP workflow. |
| <a name="output_name"></a> [name](#output\_name) | Fully-qualified service account resource name. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Related

- [terraform-gcp-iam](https://github.com/JamesWoolfenden/terraform-gcp-iam) — project-level IAM bindings
