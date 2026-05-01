resource "aws_iam_role" "instance_web" {
  name = "${local.project}-iamrole-instance-web"

  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role_policy.json

  tags = {
    Name = "${local.project}-iamrole-instance-web"
  }
}

resource "aws_iam_role_policy_attachment" "instance_web_ssm" {
  role       = aws_iam_role.instance_web.name
  policy_arn = data.aws_iam_policy.aws_ssm_core_policy.arn
}

resource "aws_iam_instance_profile" "instance_web" {
  name = "${local.project}-iamprofile-instance-web"

  role = aws_iam_role.instance_web.name

  tags = {
    Name = "${local.project}-iamprofile-instance-web"
  }
}

resource "aws_security_group" "instance_web" {
  name = "${local.project}-sg-instance-web"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${local.project}-sg-instance-web"
  }
}

resource "aws_instance" "web" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.instance_web.id]
  iam_instance_profile   = aws_iam_instance_profile.instance_web.name
  depends_on             = [aws_iam_role_policy_attachment.instance_web_ssm]

  tags = {
    Name = "${local.project}-instance-web"
  }
}
