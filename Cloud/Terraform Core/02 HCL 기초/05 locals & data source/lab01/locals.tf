locals {
  project     = "tf-core-lab02"
  environment = var.env

  namespace   = "${local.project}-${local.environment}"
  
  instance = {
    spec = {
      type = var.instance_type
    }

    allow_access = {
      port = var.web_port
      cidr = var.allow_cidr
    }
  }
}
