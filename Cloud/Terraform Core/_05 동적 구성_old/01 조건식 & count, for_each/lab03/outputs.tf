output "network" {
  value = {
    vpc_id = aws_vpc.main.id

    natgw = local.network.natgw_enabled ? {
      id        = aws_nat_gateway.main[0].id
      subnet_id = aws_nat_gateway.main[0].subnet_id
    } : {}
    
    eip = local.network.natgw_enabled ? {
      id        = aws_eip.natgw[0].id
      public_ip = aws_eip.natgw[0].public_ip
    } : {}
  }
}