variable "ami_id" {}
variable "sg_id" {}
variable "subnet_id" {}

resource "aws_instance" "web" {
  ami                         = var.ami_id
  instance_type              = "t2.micro"
  subnet_id                  = var.subnet_id
  vpc_security_group_ids     = [var.sg_id]
  associate_public_ip_address = true
}
