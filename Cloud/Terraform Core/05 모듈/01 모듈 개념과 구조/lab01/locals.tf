locals {
  org         = "tf-core"
  project     = "lab01"
  environment = var.env

  namespace = "${local.org}-${local.project}-${local.environment}"
}
