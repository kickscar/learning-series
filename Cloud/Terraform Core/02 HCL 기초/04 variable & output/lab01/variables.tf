variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "EC2 Instance Type"
}

variable "service_port" {
  type        = number
  default     = 80
  description = "Service Port"
}

variable "cidr_blocks" {
  type        = list(string)
  default     = ["127.0.0.0/32"]
  description = "Security Group Allowed CIDR Blocks"
}
