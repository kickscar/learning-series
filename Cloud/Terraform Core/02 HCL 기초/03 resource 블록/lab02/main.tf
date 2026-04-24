resource "aws_security_group" "instance_minimal" {
  name = "${local.project}-sg-instance-minimal"

  ingress {
    from_port   = 22
    to_port     = 22
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
    Name = "${local.project}-sg-instance-minimal"
  }
}

resource "aws_instance" "minimal" {
  ami                         = "ami-0c003e98ceffee43e"
  instance_type               = "t3.micro"
  key_name                    = "key-tf-core"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.instance_minimal.id]

  tags = {
    Name = "{local.project}-instance-minimal"
  }
}
