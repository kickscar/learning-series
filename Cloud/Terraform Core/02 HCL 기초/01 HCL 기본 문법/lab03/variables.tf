variable "env" {
  type        = string
  default     = "dev"
  description = "Deployment Environment"
}

variable "ports" {
  type        = list(number)
  default     = []
  description = " Allowed Ports of Instance"
}
