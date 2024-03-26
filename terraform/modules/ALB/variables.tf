variable "vpc_id" {
  
}
variable "public_subnets" {
type = list(string)
}

variable "cluster_name" {
  type = string
}

variable "alb_security_group_id" {

}