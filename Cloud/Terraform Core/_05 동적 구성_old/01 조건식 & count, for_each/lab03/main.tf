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

resource "aws_eip" "natgw" {
  count = local.network.natgw_enabled ? 1 : 0

  domain = "vpc"

  tags = {
    Name = "${local.namespace}-eip-natgw"
  }
}

resource "aws_nat_gateway" "main" {
  count = local.network.natgw_enabled ? 1 : 0

  allocation_id = aws_eip.natgw[0].id

  tags = {
    Name = "${local.namespace}-natgw"
  }
}
