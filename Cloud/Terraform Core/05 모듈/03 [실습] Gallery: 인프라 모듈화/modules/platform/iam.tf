resource "aws_iam_role" "this" {
  name = "${local.namespace}-iamrole-${local.iam.role.name}"

  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role_policy.json

  tags = {
    Name = "${local.namespace}-iamrole-${local.iam.role.name}"
  }
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = local.iam.role.policy_arn
}

resource "aws_iam_instance_profile" "this" {
  name = "${local.namespace}-iamprofile-${local.iam.role.name}"

  role = aws_iam_role.this.name

  tags = {
    Name = "${local.namespace}-iamprofile-${local.iam.role.name}"
  }
}
