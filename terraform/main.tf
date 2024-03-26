
module "vpc" {
  source          = "./modules/VPC"
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs
  security_group_ids = module.security.security_group_ids
}

module "security" {
  source = "./modules/security"
  vpc_id = module.vpc.vpc_id
}

module "eks" {
  source = "./modules/EKS"
  vpc_id = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets_ids
  cluster_name = var.cluster_name
}
