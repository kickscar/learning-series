output "platform_iam" {
  value = {
    iam_instance_profile = {
      for k, v in local.platform_iam_instance_profile : k => {
        id = aws_iam_instance_profile.main[k].id
        name = aws_iam_instance_profile.main[k].name
      }
    }
  }
}
