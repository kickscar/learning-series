output "instance" {
  value = {
    (local.instance.name) = {
      id        = aws_instance.this.id
      public_ip = aws_instance.this.public_ip
    }
  }
}

output "iamrole" {
  value = {
    (local.iamrole.name) = {
      arn = aws_iam_role.this.arn
    }
  }
}

output "iamprofile" {
  value = {
    (local.iamrole.name) = {
      name = aws_iam_instance_profile.this.name
    }
  }
}

output "sg" {
  value = {
    id   = aws_security_group.this.id
    name = aws_security_group.this.name

    ingress = [for v in aws_security_group.this.ingress : {
      from_port   = v.from_port
      to_port     = v.to_port
      protocol    = v.protocol
      cidr_blocks = v.cidr_blocks
    }]
  }
}

output "web_endpoint" {
  value = "http://${aws_instance.this.public_ip}:${local.instance.allow_access.port}"
}
