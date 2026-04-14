locals {
    tags = {
        Project   = "tf-core"
        ManagedBy = "Terraform"
    }

    namespace = "${local.tags.Project}-${var.env}"
}