resource "aws_security_group" "instance" {
    name = "${local.namespace}-sg-instance"   

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "${local.namespace}-sg-instance"
    }
}
