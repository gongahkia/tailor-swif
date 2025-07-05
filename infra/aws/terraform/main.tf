terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket         = var.state_bucket
    key            = "${var.env}/terraform.tfstate"
    region         = var.region
    dynamodb_table = var.lock_table
    encrypt        = true
  }
}

provider "aws" {
  region = var.region
  profile = var.aws_profile
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  name    = "${var.project}-vpc"
  cidr    = var.vpc_cidr
  azs     = var.azs
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  enable_nat_gateway = true
  single_nat_gateway = true
}

module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  identifier = "${var.project}-db"
  engine = "postgres"
  engine_version = "15.4"
  instance_class = "db.t3.micro"
  allocated_storage = 20
  name     = var.db_name
  username = var.db_username
  password = var.db_password
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  db_subnet_group_name   = module.vpc.database_subnet_group
  skip_final_snapshot    = true
}

module "ecs" {
  source = "terraform-aws-modules/ecs/aws"
  cluster_name = "${var.project}-ecs"
  vpc_id = module.vpc.vpc_id
  subnets = module.vpc.private_subnets
}

module "s3" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  bucket  = "${var.project}-assets-${var.env}"
  acl     = "private"
  versioning = {
    enabled = true
  }
  force_destroy = true
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "rds_endpoint" {
  value = module.rds.db_instance_endpoint
}

output "s3_bucket" {
  value = module.s3.bucket
}