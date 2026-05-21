locals {
  org         = "tf-core"
  project     = "gallery"
  environment = var.env
  namespace   = "${local.org}-${local.project}-${local.environment}"

  infra = {
    lb = {
      listener_port = 80
    }

    lt = {
      service_port  = 8080
      instance_type = var.infra_lt_instance_type
    }

    asg = {
      deploy_version   = "1.0.2"
      min_size         = var.infra_asg_min_size
      max_size         = var.infra_asg_max_size
      desired_capacity = var.infra_asg_desired_capacity
    }
  }
}
