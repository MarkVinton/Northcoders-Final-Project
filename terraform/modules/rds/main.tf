resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds_subnet_group"
  subnet_ids = var.private_subnets

  tags = {
    Name = "RYMP RDS Subnet Group"
  }
}

resource "aws_rds_cluster" "main" {
  cluster_identifier         = "rymp-rds-cluster"
  engine                     = var.engine
  engine_version             = var.engine_version
  master_username            = var.db_master_username 
  master_password            = var.db_master_password
  database_name              = var.db_name 
  availability_zones         = var.azs
  db_subnet_group_name       = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids     = var.security_group_ids
  backup_retention_period    = var.backup_retention_days
  skip_final_snapshot        = true
  deletion_protection        = false
}

resource "aws_rds_cluster_instance" "dbinstance_1" {
  engine                     = var.engine
  engine_version             = var.engine_version
  cluster_identifier  = aws_rds_cluster.main.id
  instance_class      = "db.t2g.micro"
}