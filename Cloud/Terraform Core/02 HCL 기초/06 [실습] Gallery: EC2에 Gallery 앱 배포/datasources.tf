data "aws_ami" "amazon_linux" {
    most_recent = true
    
    filter {
        name   = "name"
        values = ["al2023-ami-*-x86_64"]
    }

    owners = ["amazon"]
}

data "aws_availability_zones" "available" {
    state = "available"
}

data "aws_vpc" "default" {
    default = true
}

data "aws_subnets" "default" {
    filter {
        name   = "vpc-id"
        values = [data.aws_vpc.default.id]
    }

    filter {
        name   = "availability-zone"
        values = [local.selected_az]
    }
}

data "aws_iam_policy_document" "ec2_assume_role" {
    statement {
        actions = ["sts:AssumeRole"]
        effect  = "Allow"

        principals {
            type        = "Service"
            identifiers = ["ec2.amazonaws.com"]
        }
    }
}