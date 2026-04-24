resource "aws_security_group" "instance" {
  name = "${local.project}-sg-instance"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${local.project}-sg-instance"
  }

  lifecycle {
    #        prevent_destroy = true
    #        ignore_changes = [tags]
    #        create_before_destroy = true
  }
}
