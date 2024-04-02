resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds_subnet_group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "RYMP RDS Subnet Group"
  }
}

resource "aws_db_instance" "dbinstance" {
  identifier         = "dbinstance"
  instance_class      = "db.t3.micro" 
  allocated_storage = 20
  engine                     = var.engine
  engine_version             = var.engine_version
  username            = var.db_master_username 
  password            = var.db_master_password
  db_subnet_group_name       = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids     = var.security_group_ids
  skip_final_snapshot        = true
  publicly_accessible    = false
  deletion_protection        = false
}