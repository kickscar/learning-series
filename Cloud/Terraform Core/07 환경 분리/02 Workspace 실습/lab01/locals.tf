locals {
  org         = "tf-core"
  project     = "lab01"
  environment = terraform.workspace

  namespace = "${local.org}-${local.project}-${local.environment}"
}
