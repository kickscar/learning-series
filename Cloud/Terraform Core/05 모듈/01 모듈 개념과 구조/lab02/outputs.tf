output "module_output" {
  value = {
    network = module.network
    iam = module.iam
  }
}
