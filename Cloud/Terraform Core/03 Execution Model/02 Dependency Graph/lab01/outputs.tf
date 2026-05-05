output "instance" {
  value = {
    (local.instance.name) = {
      id = aws_instance.this.id
    }
  }
}
