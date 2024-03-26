variable "engine" {
  description = "Database engine"
  type        = string
}

variable "azs" {
    type = list(string)
}

variable "engine_version" {
  type        = string
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

variable "private_subnets" {
  type        = list(string)
  description = "A list of the CIDR ranges required for the private subnets"
}

variable "security_group_ids" {
  description = "IDs of security groups to attach to RDS"
  type        = list(string)
}

variable "backup_retention_days" {
  description = "Number of days to retain automated backups"
  type        = number
}
