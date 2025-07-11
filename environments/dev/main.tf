module "vpc" {
  source              = "../../modules/vpc"
  cidr_block          = var.cidr_block
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs  = var.private_subnet_cidrs
}

module "s3" {
  source      = "../../modules/s3"
  bucket_name = "myproject-logs-dev"
  environment = "dev"
}

module "security_group" {
  source              = "../../modules/security_group"
  name                = "myapp"
  vpc_id              = module.vpc.vpc_id
  environment         = "dev"
}

module "ec2" {
  source              = "../../modules/ec2"
  ami_id              = var.ami_id
  instance_type       = var.instance_type
  key_name            = var.key_name
  #vpc_id              = module.vpc.vpc_id  
  subnet_id           = module.vpc.public_subnet_ids[0]
  security_group_ids  = [module.security_group.ec2_sg_id]
  environment         = "dev"
}

module "ecs" {
  source              = "../../modules/ecs"
  execution_role_arn = var.execution_role_arn
  task_role_arn      = var.task_role_arn
  container_image    = var.container_image
  subnet_id         = module.vpc.public_subnet_ids
  #security_group_ids = [module.security_group.sg_id]
  environment        = "dev"
}

module "alb" {
  source                      = "../../modules/alb"
  name                        = "myapp-alb"
  vpc_id                      = module.vpc.vpc_id
  subnet_ids = [
    module.vpc.public_subnet_id[0],
    module.vpc.public_subnet_id[1]
  ]
  security_group_ids          = [module.security_group.alb_sg_id]
  environment                 = "dev"
  enable_deletion_protection = false
}


# module "security_group" {
#   source     = "../../modules/security_group"  # モジュールのパスに注意
#   vpc_id     = module.vpc.vpc_id
#   # 他の必要な変数があればここに追加
# }

