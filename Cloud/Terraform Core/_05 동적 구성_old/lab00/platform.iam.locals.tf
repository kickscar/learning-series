# platform/iam/locals.tf

locals {
  platform_iam_service_principals = {
    # Workload 계열
    instance = "ec2.amazonaws.com"
    ecs      = "ecs-tasks.amazonaws.com"
    lambda   = "lambda.amazonaws.com"
    # Platform 계열
    apigw = "apigateway.amazonaws.com"
    batch = "batch.amazonaws.com"
    cwlog = "logs.amazonaws.com"
    # 추가 가능성 높은 녀석들
    states = "states.amazonaws.com"
    events = "events.amazonaws.com"
  }

  platform_iam_roles = {
    for v in local.platform.iam.roles : v.name => {
      service  = v.service
      policies = v.policies
    }
  }

  platform_iam_instance_profile = {
    for k, v in local.platform_iam_roles : k => v if v.service == "instance"
  }

  platform_iam_role_policy = {
    for v in flatten([
      for k, v in { for k, v in local.platform_iam_roles : k => v.policies } : [
        for p in v : { name = k, policy = p }
      ]
    ]) : "${v.name}-${v.policy}" => v
  }
}
