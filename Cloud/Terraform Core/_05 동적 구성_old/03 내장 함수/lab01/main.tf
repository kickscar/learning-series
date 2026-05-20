#
# network
#

# VPC
resource "aws_vpc" "main" {
  cidr_block           = local.network.cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${local.namespace}-vpc"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${local.namespace}-igw"
  }
}

# EIP
resource "aws_eip" "natgw" {
  for_each = toset([ for s in lookup(local.network, "natgw_subnets", []) : s if lookup(aws_subnet.main, s, null) != null ])

  domain = "vpc"

  tags = {
    Name = "${local.namespace}-eip-natgw-${each.value}"
  }
}

# NAT Gatway
resource "aws_nat_gateway" "main" {
  for_each = toset([ for s in lookup(local.network, "natgw_subnets", []) : s if lookup(aws_subnet.main, s, null) != null ])

  allocation_id = aws_eip.natgw[each.value].id
  subnet_id     = aws_subnet.main[each.value].id

  tags = {
    Name = "${local.namespace}-natgw-${each.value}"
  }
}

# Subnet
resource "aws_subnet" "main" {
  for_each = lookup(local.network, "subnets", {})

  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = "${local.namespace}-subnet-${each.key}"
  }
}

# Route Table
resource "aws_route_table" "main" {
  for_each = lookup(local.network, "subnets", {})

  vpc_id = aws_vpc.main.id

  dynamic "route" {
    for_each = toset(startswith(each.key, "public") ? [1] : [])

    content {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.main.id
    }
  }

  dynamic "route" {
    for_each = toset(
      startswith(each.key, "private") &&
      lookup(each.value, "ref_natgw_subnet", null) != null &&
      contains(keys(aws_nat_gateway.main), lookup(each.value, "ref_natgw_subnet", ""))
      ? [1] : [])

    content {
      cidr_block     = "0.0.0.0/0"
      nat_gateway_id = aws_nat_gateway.main[each.value.ref_natgw_subnet].id
    }
  }

  tags = {
    Name = "${local.namespace}-rt-${each.key}"
  }
}

# Route Table Associtation
resource "aws_route_table_association" "main" {
  for_each = lookup(local.network, "subnets", {})

  subnet_id      = aws_subnet.main[each.key].id
  route_table_id = aws_route_table.main[each.key].id
}


#
# Platform
#

# Security Group
resource "aws_security_group" "main" {
  for_each = local.sg_config

  vpc_id = aws_vpc.main.id

  dynamic "ingress" {
    for_each = [each.value]

    content {
      to_port     = ingress.value.port
      from_port   = ingress.value.port
      cidr_blocks = ingress.value.cidrs
      protocol    = "tcp"
    }
  }

  dynamic "egress" {
    for_each = each.key == "instance-service" ? [1] : []

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
