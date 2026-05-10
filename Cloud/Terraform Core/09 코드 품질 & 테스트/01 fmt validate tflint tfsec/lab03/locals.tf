locals {
  org       = "tf-core"
  project   = "lab01"
  namespace = "${local.org}-${local.project}"

  instance = {
    name                        = "web"
    ami                         = "ami-0c003e98ceffee43e"
    instance_type               = "t3.small"
    associate_public_ip_address = true

    allow_access = {
      port = 80
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
