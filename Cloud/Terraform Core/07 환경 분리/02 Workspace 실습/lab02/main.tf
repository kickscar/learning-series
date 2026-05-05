resource "aws_instance" "this" {
  instance_type               = local.instance.instance_type
  ami                         = local.instance.ami
  subnet_id                   = local.instance.subnet_id
  associate_public_ip_address = local.instance.associate_public_ip_address

  vpc_security_group_ids = [aws_security_group.this.id]
  iam_instance_profile   = aws_iam_instance_profile.this.name

  depends_on = [aws_iam_role_policy_attachment.instance_web_ssm]

  tags = {
    Name = "${local.namespace}-instance-web"
  }
}

resource "aws_security_group" "this" {
  name   = "${local.namespace}-sg-instance-web"
  vpc_id = local.vpc_id

  ingress {
    from_port   = local.instance.allow_access.port
    to_port     = local.instance.allow_access.port
    protocol    = "tcp"
    cidr_blocks = local.instance.allow_access.cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${local.namespace}-sg-instance-web"
  }
}

resource "aws_iam_role" "this" {
  name               = "${local.namespace}-iamrole-instance-web"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role_policy.json

  tags = {
    Name = "${local.namespace}-iamrole-instance-web"
  }
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.instance_web.name
  policy_arn = data.aws_iam_policy.aws_ssm_core_policy.arn
}

resource "aws_iam_instance_profile" "instance_web" {
  name = "${local.namespace}-iamprofile-instance-web"
  role = aws_iam_role.instance_web.name

  tags = {
    Name = "${local.namespace}-iamprofile-instance-web"
  }
}
