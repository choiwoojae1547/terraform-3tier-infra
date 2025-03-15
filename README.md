# Terraform 3-Tier Architecture Project

## 구조
- VPC: 퍼블릭/프라이빗 서브넷 구성
- EC2: 웹 서버
- RDS: MySQL 데이터베이스
- Security Groups: 웹/DB용 분리

## 디렉토리 구조
```
terraform-3tier-infra/
├─ main.tf
├─ variables.tf
├─ terraform.tfvars (gitignore됨)
├─ modules/
│  ├─ vpc/
│  ├─ sg/
│  ├─ ec2/
│  └─ rds/
```

## 실행 방법
```bash
terraform init
terraform plan
terraform apply
```
