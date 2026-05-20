# platform/iam/main.tf

resource "aws_iam_role" "main" {
  for_each = local.platform_iam_roles

  name               = "${local.namespace}-iamrole-${each.key}"
  assume_role_policy = data.aws_iam_policy_document.main[each.key].json

  tags = {
    Name = "${local.namespace}-iamrole-${each.key}"
  }
}

resource "aws_iam_instance_profile" "main" {
  for_each = local.platform_iam_instance_profile

  name = "${local.namespace}-iamprofile-${each.key}"
  role = aws_iam_role.main[each.key].name

  tags = {
    Name = "${local.namespace}-iamprofile-${each.key}"
  }

  depends_on = [aws_iam_role_policy_attachment.main]   
}

resource "aws_iam_role_policy_attachment" "main" {
  for_each = local.platform_iam_role_policy

  role       = aws_iam_role.main[each.value.name].name
  policy_arn = startswith(each.value.policy, "arn:aws:iam::") ? each.value.policy : aws_iam_policy.main[each.value.policy].arn
}
