# platform/service/locals.tf

locals {
  platform_service = {
    s3bucket = [
      for v in try(local.platform.service, []) : v if v.type == "s3bucket"
    ]

    lb = [
      for v in try(local.platform.service, []) : v if v.type == "lb"
    ]

    ecs = [
      for v in try(local.platform.service, []) : v if v.type == "ecs"
    ]
  }

  platform_service_sg = {
    for v in local.platform_service.lb  : v.name => v.listener
    if v.lb_type == "application" &&
    can(v.listener) &&
    can(v.listener.port) &&
    can(v.listener.cidrs)
  }

  platform_service_iam_policy = {
    for v in flatten([
      for v in try(local.platform.service, []) : v.iam_policy if can(v.iam_policy)
    ]) : v.name => v
  }
}
