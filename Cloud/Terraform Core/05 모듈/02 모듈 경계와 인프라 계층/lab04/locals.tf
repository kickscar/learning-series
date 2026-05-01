locals {
  org         = "tf-core"
  project     = "lab04"
  environment = var.env

  namespace = "${local.org}-${local.project}-${local.environment}"
}
