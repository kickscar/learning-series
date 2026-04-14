output "sg_instance_minimal_id" {
  value = aws_security_group.instance_minimal.id
}

output "instance_minimal_id" {
  value = aws_instance.minimal.id
}

output "instance_minimal_public_ip" {
  value = aws_instance.minimal.public_ip
}

output "How_to_Connect" {
  value = aws_instance.minimal.public_ip != "" ? "ssh -i <your_key_pair>.pem ec2-user@${aws_instance.minimal.public_ip}" : "No public IP assigned"
}
