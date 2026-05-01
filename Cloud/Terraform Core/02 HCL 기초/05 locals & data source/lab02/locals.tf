locals {
  project     = "tf-corelab02"
  environment = var.env

  namespace = "${local.project}-${local.environment}"

  instance = {
    instance_type = var.instance_type
    ami           = data.aws_ami.amazon_linux.id
    vpc_id        = data.aws_vpc.default.id
    subnet_id     = data.aws_subnets.default.ids[0]

    allow_access = {
      port        = var.service_port
      cidr_blocks = var.cidr_blocks
    }
  }
}
