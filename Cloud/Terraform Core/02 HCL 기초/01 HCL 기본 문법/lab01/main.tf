resource "aws_security_group" "web" {
  name        = local.sg_name
  description = local.sg_description
}