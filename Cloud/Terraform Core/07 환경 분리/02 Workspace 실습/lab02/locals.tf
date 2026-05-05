locals {
  org         = "tf-core"
  project     = "lab02"
  environment = terraform.workspace

  namespace = "${local.org}-${local.project}-${local.environment}"
  vpc_id    = data.aws_vpc.default.id

  environment_config = {
    dev = {
      instance = {
        instance_type               = "t3.micro"
        subnet_id                   = data.aws_subnets.default.ids[0]
        associate_public_ip_address = true

        allow_access = {
          port        = 8080
          cidr_blocks = ["0.0.0.0/0"]
        }
      }
    }

    prod = {
      instance = {
        instance_type               = "t3.small"
        subnet_id                   = data.aws_subnets.default.ids[0]
        associate_public_ip_address = true

        allow_access = {
          port        = 80
          cidr_blocks = ["0.0.0.0/0"]
        }
      }
    }
  }

  instance = local.environment_config[local.environment].instance
}
