# workload/outputs.tf

output "workload" {
  value = {
    instance = {
      for k, v in local.workload_instance : k => {
        id = aws_instance.main[k].id
        private_ip = aws_instance.main[k].private_ip
        public_ip = aws_instance.main[k].public_ip
      } 
    }
  }
}