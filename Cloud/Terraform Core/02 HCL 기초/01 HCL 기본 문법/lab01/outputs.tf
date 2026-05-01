output "sg_name" {
  value       = aws_security_group.web.name
  description = "main에서 정의한 SG 이름 — plan에서 확정"
}

output "sg_id" {
  value       = aws_security_group.web.id
  description = "AWS가 부여하는 SG ID — apply 후 확정"
}
