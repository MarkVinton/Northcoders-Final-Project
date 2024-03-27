data "aws_availability_zones" "available" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = "team-project-VPC"

  cidr = "10.0.0.0/16"
  azs  = slice(data.aws_availability_zones.available.names, 0, length(var.public_subnets))

  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  map_public_ip_on_launch = true

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  
  public_subnet_tags = {
    "Name" = "team-project-public-subnet"
  }

  private_subnet_tags = {
    "Name" = "team-project-private-subnet"
  }

  tags = {
    "Name" = "team-project-VPC"
  }
}