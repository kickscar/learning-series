output "instance_web_id" {
  value = aws_instance.this.id
}

output "instance_web_public_ip" {
  value = aws_instance.this.public_ip
}

output "sg_instance_web_id" {
  value = aws_security_group.this.id
}

output "sg_instance_web_name" {
  value = aws_security_group.this.name
}
