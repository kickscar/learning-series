locals {
  org         = "tf-core"
  project     = "lab00"
  environment = var.env
  namespace   = "${local.org}-${local.project}-${local.environment}"

  # network configuration
  network = {
    cidr = var.vpc_cidr
    subnet = [
      {
        name = "public-a"
        type = "public"
        az   = "ap-northeast-2a"
        cidr = cidrsubnet(var.vpc_cidr, 8, 1)
      },
      {
        name = "public-b"
        type = "public"
        az   = "ap-northeast-2b"
        cidr = cidrsubnet(var.vpc_cidr, 8, 2)
      },
      {
        name             = "private-c"
        type             = "private"
        az               = "ap-northeast-2c"
        cidr             = cidrsubnet(var.vpc_cidr, 8, 101)
        ref_natgw_subnet = "public-a"
      },
      {
        name             = "private-d"
        type             = "private"
        az               = "ap-northeast-2d"
        cidr             = cidrsubnet(var.vpc_cidr, 8, 102)
        ref_natgw_subnet = "public-a"
      }
    ]
    natgw_subnet = ["public-a"]
  }

  # platform configuration
  platform = {
    service = [
      {
        type = "s3bucket"
        name = "${local.namespace}"

        versioning          = false
        public_access_block = true
        iam_policy = {
          name      = "s3bucket-access"
          actions   = ["s3:ListBucket", "s3:GetObject", "s3:PutObject", "s3:DeleteObject"]
          resources = ["arn:aws:s3:::${local.namespace}", "arn:aws:s3:::${local.namespace}/*"]
        }
      },
      {
        type = "lb"
        name = "app"

        lb_type = "application"
        subnet  = ["public-a", "public-b"]

        listener = {
          port     = var.service_port
          cidrs    = ["0.0.0.0/0"]
          protocol = "HTTP"
        }

        target_group = {
          port        = var.app.port
          protocol    = "HTTP"
          target_type = "instance"

          health_check = {
            enabled  = true
            protocol = "HTTP"
            path     = var.app.health_check
            port     = var.app.port
          }
        }
      },
      {
        type = "ecs"
        name = "task"

        iam_policy = [
          {
            name      = "ecs-task-logs"
            actions   = ["logs:CreateLogGroup", "logs:CreateLogStream", "logs:PutLogEvents", "logs:DescribeLogStreams"]
            resources = ["arn:aws:logs:*:*:log-group:/ecs/${local.namespace}/*"]
          },
          {
            name      = "ecs-secrets-access"
            actions   = ["ssm:GetParameters", "secretsmanager:GetSecretValue"]
            resources = ["*"]
          }
        ]
      }
    ]

    iam = {
      roles = [
        {
          name    = "instance"
          service = "instance"

          policies = [
            "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
            "s3bucket-access"
          ]
        },
        {
          name    = "ecs"
          service = "ecs"

          policies = [
            "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy",
            "ecs-task-logs",
            "ecs-secrets-access"
          ]
        },
        {
          name    = "lambda"
          service = "lambda"

          policies = [
            "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole",
            "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
          ]
        }
      ]
    }
  }

  # workload configuration
  workload = [
    {
      type              = "instance"
      name              = "web01"

      ami               = data.aws_ami.amazon_linux.id
      instance_type     = var.instance_type
      subnet            = "private-c"
      public_ip_enabled = false
      instance_profile  = "instance"

      user_data = templatefile("${path.module}/templates/user_data.sh.tpl", {
        profile     = local.environment
        server_port = var.app.port
      })

      endpoint = {
        port  = var.app.port
        cidrs = [var.vpc_cidr]
      }
    },
    {
      type              = "instance"
      name              = "web02"

      ami               = data.aws_ami.amazon_linux.id
      instance_type     = var.instance_type
      subnet            = "private-d"
      public_ip_enabled = false
      instance_profile  = "instance"

      user_data = templatefile("${path.module}/templates/user_data.sh.tpl", {
        profile     = local.environment
        server_port = var.app.port
      })

      allowed_port = {
        port  = var.app.port
        cidrs = [var.vpc_cidr]
      }
    }    
  ] 
  
}
