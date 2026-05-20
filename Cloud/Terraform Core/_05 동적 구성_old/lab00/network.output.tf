output "network" {
  value = {
    vpc = {
      id = aws_vpc.main.id
    }

    subnet = {
      for k in keys(local.network_subnet) : k => {
        id = aws_subnet.main[k].id
      }
    }
  }
}
