# platform/service/outputs.tf

output "platform_service" {
  value = {
    s3bucket = {
      for v in local.platform_service.s3bucket : v.name => {
        id = aws_s3_bucket.main[v.name].id
        arn = aws_s3_bucket.main[v.name].arn
        name = aws_s3_bucket.main[v.name].bucket
      }
    }

    lb = {
      for v in local.platform_service.lb : v.name => {
        type = aws_lb.main[v.name].load_balancer_type
        endpoint = "${aws_lb.main[v.name].dns_name}:${aws_lb_listener.main[v.name].port}"
        zone_id = aws_lb.main[v.name].zone_id
        target_group = {
          arn = aws_lb_target_group.main[v.name].arn
        }
      }
    }

    iam_policy = {
      for k, v in local.platform_service_iam_policy : k => {
        arn = aws_iam_policy.main[v.name].arn
      }
    }
  }
}
