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

resource "aws_security_group" "instance" {
  vpc_id = aws_vpc.main.id

  dynamic "ingress" {
    for_each = toset(local.sg_config)

    content {
      to_port     = ingress.value.port
      from_port   = ingress.value.port
      cidr_blocks = ingress.value.cidrs
      protocol    = "tcp"
    }
  }

  egress {
    to_port     = 0
    from_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
  }

  tags = {
    Name = "${local.namespace}-sg-instance"
  }
}
