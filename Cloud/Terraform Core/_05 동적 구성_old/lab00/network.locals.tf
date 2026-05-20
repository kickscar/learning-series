locals {
  network_natgw = [
    for v in lookup(local.network, "natgw_subnet", []) : v
  ]

  network_subnet = {
    for v in lookup(local.network, "subnet", []) : v.name => v
  }
}
