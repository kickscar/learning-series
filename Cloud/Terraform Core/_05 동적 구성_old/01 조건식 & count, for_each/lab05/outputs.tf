output "network" {
  value = {
    vpc_id = aws_vpc.main.id

    natgws = {
      natgw_public_a = {
        id            = aws_nat_gateway.main["public-a"].id
        subnet_id     = aws_nat_gateway.main["public-a"].subnet_id
        allocation_id = aws_nat_gateway.main["public-a"].allocation_id

        eip = {
          id        = aws_eip.natgw["public-a"].id
          public_ip = aws_eip.natgw["public-a"].public_ip
        }
      }
      natgw_public_b = {
        id            = aws_nat_gateway.main["public-b"].id
        subnet_id     = aws_nat_gateway.main["public-b"].subnet_id
        allocation_id = aws_nat_gateway.main["public-b"].allocation_id

        eip = {
          id        = aws_eip.natgw["public-b"].id
          public_ip = aws_eip.natgw["public-b"].public_ip
        }
      }

      subnets = {
        subnet_public_a = {
          id         = aws_subnet.main["public-a"].id
          az         = aws_subnet.main["public-a"].availability_zone
          cidr_block = aws_subnet.main["public-a"].cidr_block

          route_table = {
            id    = aws_route_table.main["public-a"].id
            route = aws_route_table.main["public-a"].route
          }
        }

        subnet_private_b = {
          id         = aws_subnet.main["public-b"].id
          az         = aws_subnet.main["public-b"].availability_zone
          cidr_block = aws_subnet.main["public-b"].cidr_block

          route_table = {
            id    = aws_route_table.main["public-b"].id
            route = aws_route_table.main["public-b"].route
          }
        }

        subnet_private_c = {
          id         = aws_subnet.main["private-c"].id
          az         = aws_subnet.main["private-c"].availability_zone
          cidr_block = aws_subnet.main["private-c"].cidr_block

          route_table = {
            id    = aws_route_table.main["private-c"].id
            route = aws_route_table.main["private-c"].route
          }
        }

        subnet_private_d = {
          id         = aws_subnet.main["private-d"].id
          az         = aws_subnet.main["private-d"].availability_zone
          cidr_block = aws_subnet.main["private-d"].cidr_block

          route_table = {
            id    = aws_route_table.main["private-d"].id
            route = aws_route_table.main["private-d"].route
          }
        }
      }
    }
  }
}
