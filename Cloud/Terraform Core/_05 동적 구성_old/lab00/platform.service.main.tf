# platform/service/main.tf

# s3bucket
resource "aws_s3_bucket" "main" {
  for_each = {
    for v in local.platform_service.s3bucket : v.name => v
  }

  bucket = each.key

  tags = {
    Name = "${local.namespace}-s3bucket-${each.key}"
  }

  # lifecycle {
  #   prevent_destroy = true
  # }
}

resource "aws_s3_bucket_versioning" "main" {
  for_each = {
    for v in local.platform_service.s3bucket : v.name => v if try(v.versioning, false)
  }

  bucket = aws_s3_bucket.main[each.key].id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "main" {
  for_each = {
    for v in local.platform_service.s3bucket : v.name => v if try(v.public_access_block, true)
  }

  bucket = aws_s3_bucket.main[each.key].id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


# lb
resource "aws_lb" "main" {
  for_each = {
    for v in local.platform_service.lb : v.name => v
  }

  name                       = "${local.namespace}-lb-${each.key}"
  internal                   = false
  load_balancer_type         = each.value.lb_type
  security_groups            = [aws_security_group.platform_service[each.key].id]
  subnets                    = [for v in each.value.subnet : aws_subnet.main[v].id]
  enable_deletion_protection = false

  tags = {
    Name = "${local.namespace}-lb-${each.key}"
  }
}

resource "aws_lb_target_group" "main" {
  for_each = {
    for v in local.platform_service.lb : v.name => v
  }

  name     = "${local.namespace}-tg-${each.key}"
  vpc_id   = aws_vpc.main.id
  port     = each.value.target_group.port
  protocol = each.value.target_group.protocol
  target_type = each.value.target_group.target_type

  health_check {
    enabled             = each.value.target_group.health_check.enabled
    port                = each.value.target_group.port
    path                = each.value.target_group.health_check.path
    healthy_threshold   = 2
    unhealthy_threshold = 3
    timeout             = 5
    interval            = 30
  }

  tags = {
    Name = "${local.namespace}-tg-${each.key}"
  }
}

resource "aws_lb_listener" "main" {
  for_each = {
    for v in local.platform_service.lb : v.name => v
  }

  load_balancer_arn = aws_lb.main[each.key].arn
  port              = each.value.listener.port
  protocol          = each.value.listener.protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main[each.key].arn
  }
}

resource "aws_security_group" "platform_service" {
  for_each = local.platform_service_sg

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

  egress {
    to_port     = 0
    from_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
  }

  tags = {
    Name = "${local.namespace}-sg-lb-${each.key}"
  }
}

# iampolicy
resource "aws_iam_policy" "main" {
  for_each = local.platform_service_iam_policy

  name        = "${local.namespace}-iampolicy-${each.key}"
  description = "Custom policy for ${each.key}"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = each.value.actions

        # ARN 자동 조립
        Resource = try(each.value.resources, ["*"])
      }
    ]
  })

  tags = {
    Name = "${local.namespace}-iampolicy-${each.key}"
  }
}

