locals {
  tags = {
    project   = "tf-core-lab02"
    ManagedBy = "Terraform"
  }

  namespace = "${local.tags.project}-${var.env}"
}
