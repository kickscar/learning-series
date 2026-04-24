output "resource" {
  value = {
    namespace = local.namespace

    instance = {
      id            = aws_instance.web.id
      ami           = aws_instance.web.ami
      instance_type = aws_instance.web.instance_type
      subnet_id     = aws_instance.web.subnet_id
    }

    sg = {
      id     = aws_security_group.instance_web.id
      vpc_id = aws_security_group.instance_web.vpc_id

      ingress = [for v in aws_security_group.instance_web.ingress : {
        from_port   = v.from_port
        to_port     = v.to_port
        protocol    = v.protocol
        cidr_blocks = v.cidr_blocks
      }]
    }
  }
}
