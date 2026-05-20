resource "aws_eip" "this" {
  domain = "vpc"

  tags = {
    Name = "${local.namespace}-eip-natgw-${local.natgw.name}"
  }
}

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.this.id
  subnet_id     = aws_subnet.public_0.id

  tags = {
    Name = "${local.namespace}-natgw-${local.natgw.name}"
  }
}
