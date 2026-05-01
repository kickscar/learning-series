
module "network" {
  source = "./modules/network"

  namespace = local.namespace
}

module "platform" {
  source = "./modules/platform"

  namespace = local.namespace

  vpc_id     = module.network.vpc.id
  lb_subnets = [module.network.subnet["public-a"].id, module.network.subnet["public-b"].id]
}

module "workload" {
  source = "./modules/workload"

  namespace = local.namespace

  vpc_id = module.network.vpc.id

  instance_subnet_id                = module.network.subnet["private-b"].id
  instance_allow_access_cidr_blocks = [module.network.subnet["public-a"].cidr_block, module.network.subnet["public-b"].cidr_block]
  instance_iam_instance_profile     = module.platform.iamprofile.name

  lb_target_group_arn = module.platform.lb.target_group.arn
}
