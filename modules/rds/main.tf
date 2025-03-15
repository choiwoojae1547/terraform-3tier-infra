variable "db_username" {}
variable "db_password" {}
variable "subnet_ids" {}
variable "sg_id" {}

resource "aws_db_subnet_group" "db_subnet" {
  name       = "db-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_db_instance" "rds" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  username             = var.db_username
  password             = var.db_password
  skip_final_snapshot  = true
  vpc_security_group_ids = [var.sg_id]
  db_subnet_group_name = aws_db_subnet_group.db_subnet.name
}
