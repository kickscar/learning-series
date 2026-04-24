output "listener_port" {
  value = var.listener_port
}

output "ha_enabled" {
  value = var.ha_enabled
}

output "subnet_cidr" {
  value = var.subnet_cidr
}

output "instance" {
  value = var.instance
}

output "namespace" {
  value = local.namespace
}
