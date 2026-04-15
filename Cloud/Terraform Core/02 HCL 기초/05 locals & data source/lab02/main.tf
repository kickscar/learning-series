resource "aws_iam_role" "instance_web" {
    name = "${local.namespace}-iamrole-instance-web"

    assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json

    tags = {
        Name = "${local.namespace}-iamrole-instance-web"
    }
}

resource "aws_iam_role_policy_attachment" "instance_web_ssm" {
    role       = aws_iam_role.instance_web.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "instance_web" {
    name = "${local.namespace}-iamprofile-instance-web"

    role = aws_iam_role.instance_web.name
    
    tags = {
        Name = "${local.namespace}-iamprofile-instance-web"
    }
}

resource "aws_security_group" "instance_web" {
    name   = "${local.namespace}-sg-instance-web"   
    vpc_id = data.aws_vpc.default.id

    ingress {
        from_port   = var.web_port
        to_port     = var.web_port
        protocol    = "tcp"
        cidr_blocks = var.allowed_cidrs
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "${local.namespace}-sg-instance-web"
    }
}

resource "aws_instance" "web" {
    ami                         = "ami-0c003e98ceffee43e"
    instance_type               = var.instance_type
    subnet_id                   = data.aws_subnets.default.ids[0]
    associate_public_ip_address = true
    vpc_security_group_ids      = [aws_security_group.instance_web.id]
    iam_instance_profile        = aws_iam_instance_profile.instance_web.name 
    depends_on                  = [aws_iam_role_policy_attachment.instance_web_ssm]     

    tags = {
        Name = "${local.namespace}-instance-web"
    }
}