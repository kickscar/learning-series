locals {
  project = "tf-core-lab02"

  instance = {
    name = "web"

    ami                         = "ami-0c003e98ceffee43e"
    instance_type               = "t3.micro"
    associate_public_ip_address = true

    allow_access = {
      port        = 80
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  iamrole = {
    name = "instance-web"

    assume_role_policy = jsonencode({
      Version = "2012-10-17"

      Statement = [{
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = { Service = "ec2.amazonaws.com" }
      }]
    })

    policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  }
}
