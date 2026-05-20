output "aws_security_group_main" {
  value = {
    for k, v in aws_security_group.main : k => {
      id = v.id
      ingress = [for r in v.ingress : {
        from_port   = r.from_port
        to_port     = r.to_port
        protocol    = r.protocol
        cidr_blocks = r.cidr_blocks
      }]
      egress = [for r in v.egress : {
        from_port   = r.from_port
        to_port     = r.to_port
        protocol    = r.protocol
        cidr_blocks = r.cidr_blocks
      }]
    }
  }
}