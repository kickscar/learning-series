locals {
  org       = "tf-core"
  project   = "lab03"
  namespace = "${local.org}-${local.project}-${var.env}"

  network = {
    cidr          = "10.0.0.0/16"
    natgw_enabled = false
  }
}