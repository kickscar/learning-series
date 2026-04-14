locals {
    tags = {
        Project   = "tf-core"
        ManagedBy = "Terraform"
    } 
    
    namespace     = "${local.tags.Project}-${var.env}"
    allowed_ports = toset(var.ports)
    count_ports   = length(local.allowed_ports)
    
    resource_config = {
        sg =  {
            name = format("%s-sg-web", local.namespace)
            tags = {
                Name = join("-", [local.namespace, "sg", "web"])
            }
        }

        instance = {
            ami  = "ami-0ada8527e6dc686a3"
            type = var.env == "prod" ? "t3.samll" : "t3.micro"
            tags = merge(local.tags, {
                Name = join("-", [local.namespace, "instance", "web"])
            })
        }
    } 
}