output "alb_port" {
    value = var.alb_port
}

output "ha_mode" {
    value = var.ha_mode
}

output "subnets_cidrs" {
    value = var.subnets_cidrs
}

output "instance_config" {
    value = var.instance_config
}

output "namespace" {
    value = local.namespace
}