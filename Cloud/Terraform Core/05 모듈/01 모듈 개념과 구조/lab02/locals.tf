locals {
  org         = "tf-core"
  project     = "lab02"
  environment = var.env

  namespace = "${local.org}-${local.project}-${local.environment}"
}
