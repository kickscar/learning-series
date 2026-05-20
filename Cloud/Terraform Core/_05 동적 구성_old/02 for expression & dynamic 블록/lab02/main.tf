resource "aws_vpc" "main" {
  cidr_block           = local.network.cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${local.namespace}-vpc"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${local.namespace}-igw"
  }
}

resource "aws_security_group" "main" {
  for_each = local.sg_config

  vpc_id = aws_vpc.main.id

  dynamic "ingress" {
    for_each = toset([each.value])

    content {
      to_port     = ingress.value.port
      from_port   = ingress.value.port
      cidr_blocks = ingress.value.cidrs
      protocol    = "tcp"
    }
  }

  dynamic "egress" {
    for_each = toset(each.key == "instance-service" ? [1] : [])

    content {
      to_port     = 0
      from_port   = 0
      cidr_blocks = ["0.0.0.0/0"]
      protocol    = "-1"
    }
  }

  tags = {
    Name = "${local.namespace}-sg-${each.key}"
  }
}
