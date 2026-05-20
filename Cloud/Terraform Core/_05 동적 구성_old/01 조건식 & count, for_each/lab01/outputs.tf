output "network" {
  value = {
    vpc_id = aws_vpc.main.id
  }
}
