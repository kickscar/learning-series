resource "aws_iam_role" "instance_web" {
    name = "${local.project}-iamrole-instance-web"

    assume_role_policy = jsonencode({
        Version   = "2012-10-17"
        Statement = [{
            Action    = "sts:AssumeRole"
            Effect    = "Allow"
            Principal = { 
                Service = "ec2.amazonaws.com"
            }
        }]
    })

    tags = {
        Name = "${local.project}-iamrole-instance-web"
    }
}

resource "aws_iam_role_policy_attachment" "instance_web_ssm" {
    role       = aws_iam_role.instance_web.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "instance_web" {
    name = "${local.project}-iamprofile-instance-web"

    role = aws_iam_role.instance_web.name
    
    tags = {
        Name = "${local.project}-iamprofile-instance-web"
    }
}

resource "aws_security_group" "instance_web" {
    name = "${local.project}-sg-instance-web"

    ingress {
        from_port   = var.web_port
        to_port     = var.web_port
        protocol    = "tcp"
        cidr_blocks = var.allowed_cidrs
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "${local.project}-sg-instance-web"
    }
}

resource "aws_instance" "web" {
    ami                         = "ami-0c003e98ceffee43e"
    instance_type               = var.instance_type
    associate_public_ip_address = true
    vpc_security_group_ids      = [aws_security_group.instance_web.id]

    iam_instance_profile        = aws_iam_instance_profile.instance_web.name 
    depends_on                  = [aws_iam_role_policy_attachment.instance_web_ssm]     

    tags = {
        Name = "${local.project}-instance-web"
    }
}