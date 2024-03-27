output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets_ids" {
  value = module.vpc.public_subnets
}

output "private_subnets_ids" {
  value = module.vpc.private_subnets
}

output "public_internet_gateway_route_id" {
  description = "ID of the internet gateway route"
  value       = try(module.vpc.public_internet_gateway[0].id, null)
}

output "private_route_table_association_ids" {
  description = "List of IDs of the private route table association"
  value       = module.vpc.private_route_table_association_ids
}

output "public_route_table_ids" {
  description = "List of IDs of private route tables"
  value       = module.vpc.public_route_table_ids
}

output "public_route_table_association_ids" {
  description = "List of IDs of the private route table association"
  value       = module.vpc.public_route_table_association_ids
}

output "nat_public_ips" {
  description = "List of nat_public_ips"
  value = module.vpc.nat_public_ips
}




