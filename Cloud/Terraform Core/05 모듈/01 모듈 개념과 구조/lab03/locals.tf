locals {
  org         = "tf-core"
  project     = "lab03"
  environment = var.env

  namespace = "${local.org}-${local.project}-${local.environment}"
}
