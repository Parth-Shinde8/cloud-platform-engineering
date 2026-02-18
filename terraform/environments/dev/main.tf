module "network" {
  source      = "../../modules/network"
  environment = var.environment
}

module "compute" {
  source            = "../../modules/compute"
  environment       = var.environment
  subnet_id         = module.network.subnet_id
  security_group_id = module.network.security_group_id
  key_name          = var.key_name
}
