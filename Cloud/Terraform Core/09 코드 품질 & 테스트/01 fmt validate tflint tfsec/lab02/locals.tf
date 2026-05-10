locals {
  org       = "tf-core"
  project   = "lab02"
  namespace = "${local.org}-${local.project}"

  instance = {
    name          = "web"
    ami           = "ami-0c003e98ceffee43e"
    instance_type = "t3.xxlarge"
  }
}
