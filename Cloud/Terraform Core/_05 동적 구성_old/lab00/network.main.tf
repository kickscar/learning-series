# network/main.tf

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

resource "aws_eip" "main" {
  for_each = {
    for v in local.network_natgw : v => v if lookup(aws_subnet.main, v, null) != null
  }

  domain = "vpc"

  tags = {
    Name = "${local.namespace}-eip-natgw-${each.key}"
  }
}

resource "aws_nat_gateway" "main" {
  for_each = {
    for v in local.network_natgw : v => v if lookup(aws_subnet.main, v, null) != null
  }

  allocation_id = aws_eip.main[each.key].id
  subnet_id     = aws_subnet.main[each.key].id

  tags = {
    Name = "${local.namespace}-natgw-${each.key}"
  }
}

resource "aws_subnet" "main" {
  for_each = local.network_subnet

  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = "${local.namespace}-subnet-${each.key}"
  }
}

resource "aws_route_table" "main" {
  for_each = local.network_subnet

  vpc_id = aws_vpc.main.id

  dynamic "route" {
    for_each = toset(each.value.type == "public" ? [1] : [])

    content {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.main.id
    }
  }

  dynamic "route" {
    for_each = toset(
      each.value.type == "private" &&
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

resource "aws_route_table_association" "main" {
  for_each = local.network_subnet

  subnet_id      = aws_subnet.main[each.key].id
  route_table_id = aws_route_table.main[each.key].id
}
