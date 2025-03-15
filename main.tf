module "vpc" {
  source = "./modules/vpc"
}

module "sg" {
  source = "./modules/sg"
}

module "ec2" {
  source = "./modules/ec2"
  ami_id        = var.ami_id
  sg_id         = module.sg.web_sg_id
  subnet_id     = module.vpc.public_subnet_id
}

module "rds" {
  source = "./modules/rds"
  db_username = var.db_username
  db_password = var.db_password
  subnet_ids  = module.vpc.private_subnet_ids
  sg_id       = module.sg.db_sg_id
}
