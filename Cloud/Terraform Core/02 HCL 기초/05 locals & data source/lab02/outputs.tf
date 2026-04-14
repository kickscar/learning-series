output "namespace" {
  value = local.namespace
}

output "instance_web" {
    value = {
        id            = aws_instance.web.id
        public_ip     = aws_instance.web.public_ip
        http_endpoint = "http://${aws_instance.web.public_ip}:${var.web_port}"
    }
}

output "sg_instance_web" {
    value = {
        id   = aws_security_group.instance_web.id
        name = aws_security_group.instance_web.name

    }
}

output "ami" {
  value = {
    id   = data.aws_ami.amazon_linux.id
    name = data.aws_ami.amazon_linux.name
  }
}

output "availability_zones" {
  value = data.aws_availability_zones.available.names
}

output "vpc_default" {
  value = {
    id         = data.aws_vpc.default.id
    cidr_block = data.aws_vpc.default.cidr_block
  }
}

output "subnet" {
  value = {
    id                = data.aws_subnets.default.ids[0]
    availability_zone = local.selected_az
  }
}