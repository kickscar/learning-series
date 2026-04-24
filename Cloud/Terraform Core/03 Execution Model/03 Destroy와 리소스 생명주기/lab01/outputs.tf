output "sg_instance" {
  value = {
    id   = aws_security_group.instance.id
    name = aws_security_group.instance.name
  }
}
