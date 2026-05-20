locals {
  org       = "tf-core"
  project   = "lab01"
  namespace = "${local.org}-${local.project}-${var.env}"

  network = {
    cidr = "10.0.0.0/16"
  }

  workload = {
    instance = {
      type    = "t3.micro"
      service = { port = 8080, cidrs = ["0.0.0.0/0"] }
      ssh     = { port = 22, cidrs = ["0.0.0.0/0"] }
    }
  }

  sg_config = [for k, v in local.workload.instance : v if k == "service" || k == "ssh"]
}