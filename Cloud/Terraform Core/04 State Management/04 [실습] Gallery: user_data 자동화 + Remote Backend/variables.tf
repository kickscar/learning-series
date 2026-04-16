variable "env" {
  type        = string
  default     = "dev"
  description = "배포 환경"

  validation {
    condition     = contains(["dev", "stg", "prod"], var.env)
    error_message = "env는 dev, stg, prod 중 하나여야 한다."
  }
}

variable "instance_type" {
  type        = string
  default     = "t3.small"
  description = "EC2 인스턴스 타입 (t3.micro, t3.small, t3.medium)"

  validation {
    condition = contains(["t3.micro", "t3.small", "t3.medium"], var.instance_type)
    error_message = "instance_type은 t3.micro, t3.small, t3.medium 중 하나여야 한다."
  }
}

variable "web_port" {
  type        = number
  default     = 8080
  description = "웹 포트 (1~65535)"

  validation {
    condition = 1 <= var.web_port && var.web_port <= 65535
    error_message = "web_port는 1~65535 범위여야 한다."
  }
}

variable "allowed_cidrs" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "Security Group 허용 CIDR 목록"

  validation {
    condition = length(var.allowed_cidrs) > 0
    error_message = "allowed_cidrs는 최소 1개 이상의 CIDR을 포함해야 한다."
  }
}

variable "az_num" {
  type        = number
  default     = 1
  description = "사용할 가용 영역 번호 (1부터 시작)"

  validation {
    # 1-base 기준으로 검증
    condition     = var.az_num >= 1 && var.az_num <= length(data.aws_availability_zones.available.names)
    error_message = "가용 영역 번호는 1부터 ${length(data.aws_availability_zones.available.names)} 사이여야 한다."
  }
}