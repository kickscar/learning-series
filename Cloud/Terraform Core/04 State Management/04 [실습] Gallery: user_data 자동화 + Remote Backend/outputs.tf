output "instance_web" {
  description = "Gallery EC2 인스턴스 정보"
  value = {
    id            = aws_instance.spring.id
    public_ip     = aws_instance.spring.public_ip
    http_endpoint = "http://${aws_instance.spring.public_ip}:${var.web_port}"
  }
}