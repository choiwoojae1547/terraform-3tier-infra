# terraform-3tier-infra

# Terraform 3-Tier Architecture Project

## 구조
- VPC: 퍼블릭/프라이빗 서브넷 구성
- EC2: 웹 서버
- RDS: MySQL 데이터베이스
- Security Groups: 웹/DB용 분리

## 디렉토리 구조
terraform-3tier-project/
├─ modules/
│  ├─ vpc/
│  ├─ ec2/
│  ├─ rds/
│  └─ sg/
├─ main.tf
├─ variables.tf
├─ outputs.tf
├─ terraform.tfvars        # ← .gitignore 대상
├─ .gitignore
└─ README.md


## 실행 방법
```bash
terraform init
terraform plan
terraform apply


---

## ▶ `modules/vpc/` → `main.tf`
```hcl
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "private_subnet_ids" {
  value = [aws_subnet.private.id]
}
