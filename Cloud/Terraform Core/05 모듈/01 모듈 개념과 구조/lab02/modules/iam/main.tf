resource "aws_iam_role" "this" {
  name = "${var.namespace}-iamrole-${var.role_name}"

  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role_policy.json

  tags = {
    Name = "${var.namespace}-iamrole-${var.role_name}"
  }
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = var.policy_arn
}

resource "aws_iam_instance_profile" "this" {
  name = "${var.namespace}-iamprofile-${var.role_name}"

  role = aws_iam_role.this.name

  tags = {
    Name = "${var.namespace}-iamprofile-${var.role_name}"
  }
}
