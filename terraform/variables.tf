variable "public_subnets" {
  type        = list(string)
  description = "A list of the CIDR ranges required for the public subnets"
}

variable "private_subnets" {
  type        = list(string)
  description = "A list of the CIDR ranges required for the private subnets"
}

variable "azs" {
  type        = list(string)
  description = "A list of the Availability Zones you wish to provision infrastructure in"
}

variable "ami" {
  type = string
}
variable "cluster_name" {
  type        = string
  description = "Name for the EKS cluster"
}

variable "engine" {
  description = "Database engine"
  type        = string
}

variable "engine_version" {
  type = string
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_master_username" {
  description = "Database username"
  type        = string
}

variable "db_master_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-2"
}
variable "aws_region" {
  type = string
}

