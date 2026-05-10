resource "aws_instance" "this" {
  ami           = local.instance.ami
  instance_type = local.instance.instance_type

  tags = {
    Name = "${local.namespace}-instance-${local.instance.name}"
  }
}
