output "instance_web_id" {
  value = aws_instance.web.id
}

output "instance_web_public_ip" {
  value = aws_instance.web.public_ip
}

output "sg_instance_web_id" {
  value = aws_security_group.instance_web.id
}

output "sg_instance_web_name" {
  value = aws_security_group.instance_web.name
}
