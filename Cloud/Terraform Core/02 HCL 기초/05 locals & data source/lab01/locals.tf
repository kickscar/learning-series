locals {
  project     = "tf-core-lab02"
  environment = var.env

  namespace   = "${local.project}-${local.environment}"
  
  instance = {
    instance_type = var.instance_type

    allow_access = {
      port = var.service_port
      cidr_blocks = var.cidr_blocks
    }
  }
}
