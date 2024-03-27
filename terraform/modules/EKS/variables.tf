variable "vpc_id" {
  
}
variable "private_subnets" {
type = list(string)
}
variable "cluster_name" {
  
}
variable "public_subnets" {
  type = list(string)
}
