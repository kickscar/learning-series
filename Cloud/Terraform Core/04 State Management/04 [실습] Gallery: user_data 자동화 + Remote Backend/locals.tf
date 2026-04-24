locals {
  org     = "tf-core"
  project = "gallery"
  environment = var.env

  namespace = "${local.org}-${local.project}-${local.environment}"

  instance = {
    spec = {
      type = var.instance_type
      ami  = data.aws_ami.amazon_linux.id
    }

    network = {
      vpc_id    = data.aws_vpc.default.id
      subnet_id = data.aws_subnets.default.ids[0]
    }

    allow_access = {
      port = var.web_port
      cidr = var.allow_cidr
    }
  }
}
