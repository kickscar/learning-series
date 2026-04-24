variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "EC2 인스턴스 타입"
}

variable "web_port" {
  type        = number
  default     = 80
  description = "웹 포트"
}

variable "allowed_cidrs" {
  type        = list(string)
  default     = ["127.0.0.0/32"]
  description = "Security Group 허용 CIDR 목록"
}
