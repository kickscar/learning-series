# workload/locals.tf

locals {
  workload_instance = { 
    for v in [
      for v in flatten([local.workload]) : v if v.type == "instance"
    ] : v.name => v
  }

  workload_instance_sg = {
    for k, v in local.workload_instance  : k => flatten([lookup(v, "allowed_port", [])]) 
  }
  
}