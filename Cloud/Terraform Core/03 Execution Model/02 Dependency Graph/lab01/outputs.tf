output "instance_web" {
    value = {
        id = aws_instance.web.id
    }
}