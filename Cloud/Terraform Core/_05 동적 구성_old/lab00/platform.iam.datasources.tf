# platform/iam/datasources.tf

data "aws_iam_policy_document" "main" {
  for_each = local.platform_iam_roles

  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = [local.platform_iam_service_principals[each.value.service]]
    }
  }
}