# Terraform configuration for the development environment

# vpc module
module "vpc" {
  source               = "../../modules/vpc"
  availability_zones   = var.availability_zones
  cidr_block           = var.cidr_block
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

# s3 module
module "s3" {
  source      = "../../modules/s3"
  bucket_name = "myproject-logs-dev"
  environment = "dev"
}

# SG module
module "security_group" {
  source      = "../../modules/security_group"
  name        = "myapp"
  vpc_id      = module.vpc.vpc_id
  environment = "dev"
}

# EC2 module
module "ec2" {
  source        = "../../modules/ec2"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name 
  subnet_id          = module.vpc.public_subnet_ids[0]
  security_group_ids = [module.security_group.ec2_sg_id]
  environment        = "dev"
}

# ECS module
module "ecs" {
  source             = "../../modules/ecs"
  execution_role_arn = var.execution_role_arn
  task_role_arn      = var.task_role_arn
  container_image    = var.container_image
  subnet_id          = module.vpc.public_subnet_ids
  environment = "dev"
}

# ELB module
module "elb" {
  source      = "../../modules/elb"
  name        = "myapp-elb"
  vpc_id      = module.vpc.vpc_id
  instance_id = module.ec2.instance_id
  subnet_ids = [
    module.vpc.public_subnet_ids[0],
    module.vpc.public_subnet_ids[1]
  ]
  security_group_ids         = [module.security_group.elb_sg_id]
  environment                = "dev"
  enable_deletion_protection = false
  target_ips                 = var.elb_target_ips
}


