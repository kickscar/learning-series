locals {
  org       = "tf-core"
  project   = "gallery"
  namespace = "${local.org}-${local.project}"

  infra = {
    lb = {
      listener_port = 80
    }

    instance = {
      service_port   = 8080
      deploy_version = "1.0.0"
    }
  }
}
