# output "cluster_endpoint" {
#   description = "Endpoint for EKS control plane"
#   value = module.eks.cluster_endpoint
# }

# output "cluster_security_group_id" {
#   description = "Security group ids attached to the cluster control plane"
#   value       = module.eks.cluster_security_group_id
# }

# output "cluster_name" {
#   description = "Kubernetes Cluster Name"
#   value       = module.eks.cluster_name
# }
# output "region" {
#   description = "AWS region"
#   value       = var.region
# }

# output "public_subnets_ids" {
#   value = module.vpc.public_subnets_ids
# }

# output "private_subnets_ids" {
#   value = module.vpc.private_subnets_ids
# }

# output "public_internet_gateway_route_id" {
#   description = "ID of the internet gateway route"
#   value       = try(module.vpc.public_internet_gateway[0].id, null)
# }

# output "private_route_table_association_ids" {
#   description = "List of IDs of the private route table association"
#   value       = module.vpc.private_route_table_association_ids
# }

# output "public_route_table_ids" {
#   description = "List of IDs of private route tables"
#   value       = module.vpc.public_route_table_ids
# }

# output "public_route_table_association_ids" {
#   description = "List of IDs of the private route table association"
#   value       = module.vpc.public_route_table_association_ids
# }

# output "nat_public_ips" {
#   description = "List of nat_public_ips"
#   value = module.vpc.nat_public_ips
# }