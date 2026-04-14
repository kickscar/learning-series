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