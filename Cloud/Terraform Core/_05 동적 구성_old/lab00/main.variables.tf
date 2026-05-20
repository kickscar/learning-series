variable "env" {
  type        = string
  default     = "dev"
  description = "배포 환경"

  validation {
    condition     = contains(["dev", "stg", "prod"], var.env)
    error_message = "env는 dev, stg, prod 중 하나여야 한다."
  }
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "VPC CIDR (RFC1918 사설 대역 및 /16 이하 마스크 권장)"

  validation {
    condition = (
      can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}/([1-9]|1[0-6])$", var.vpc_cidr)) &&
      (
        startswith(var.vpc_cidr, "10.") ||
        (startswith(var.vpc_cidr, "172.") && can(regex("^172\\.(1[6-9]|2[0-9]|3[0-1])\\.", var.vpc_cidr))) ||
        startswith(var.vpc_cidr, "192.168.")
      )
    )
    error_message = "VPC CIDR은 RFC1918 사설 대역(10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16)에 속해야 하며, 마스크는 /16 이하여야 한다."
  }
}

variable "service_port" {
  type        = number
  default     = 80
  description = "사용자 접속 포트"

  validation {
    condition     = 1 <= var.service_port && var.service_port <= 65535
    error_message = "Sevice Port는 1~65535 범위여야 한다."
  }
}

variable "instance_type" {
  type        = string
  default     = "t3.small"
  description = "EC2 인스턴스 타입 (t3.micro, t3.small, t3.medium)"

  validation {
    condition     = contains(["t3.micro", "t3.small", "t3.medium"], var.instance_type)
    error_message = "Instance Type은 t3.micro, t3.small, t3.medium 중 하나여야 한다."
  }
}

variable "app" {
  type = object({
    port         = number
    health_check = string
  })

  default = {
    port         = 8080
    health_check = "/"
  }

  description = "애플리케이션 설정 (port: 1~65535 범위, health_check: 헬스체크 경로)"

  validation {
    condition     = 1 <= var.app.port && var.app.port <= 65535
    error_message = "app.port는 1~65535 범위여야 한다."
  }
}
