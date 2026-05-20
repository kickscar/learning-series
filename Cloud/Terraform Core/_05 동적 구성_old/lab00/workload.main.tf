# workload/main.tf

resource "aws_instance" "main" {
  for_each = local.workload_instance

  ami                         = each.value.ami
  instance_type               = each.value.instance_type
  subnet_id                   = aws_subnet.main[each.value.subnet].id
  associate_public_ip_address = each.value.public_ip_enabled
  vpc_security_group_ids      = [aws_security_group.workload[each.key].id]
  iam_instance_profile        = aws_iam_instance_profile.main[each.value.instance_profile].name
  user_data                   = each.value.user_data

  tags = {
    Name = "${local.namespace}-instance-${each.key}"
  }
}

resource "aws_security_group" "workload" {
  for_each = local.workload_instance_sg

  vpc_id = aws_vpc.main.id

  dynamic "ingress" {
    for_each = each.value

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
    Name = "${local.namespace}-sg-${each.key}"
  }
}
