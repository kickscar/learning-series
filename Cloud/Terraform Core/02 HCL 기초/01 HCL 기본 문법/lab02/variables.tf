variable "env" {
  type        = string
  default     = "dev"
  description = "Deployment Environment"
}

variable "listener_port" {
  type        = number
  default     = 80
  description = "ALB Listener Port"
}

variable "ha_enabled" {
  type        = bool
  default     = true
  description = "Multi-AZ(true) or Single-AZ(false)"
}

variable "subnet_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24"]
  description = "Each Subnet's CIDR"
}

variable "instance" {
  type = object({
    type   = string
    ports  = set(number)
    public = bool
  })
  default = {
    type   = "t3.micro"
    ports  = [22, 8080]
    public = true
  }
  description = "EC2 Instance Configuration"
}
