# Terraform Variables for Production Environment
environment = "prod"

# VPC Configuration
cidr_block           = "10.1.0.0/16"
public_subnet_cidrs  = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
private_subnet_cidrs = ["10.1.101.0/24", "10.1.102.0/24","10.1.103.0/24"]
availability_zones = ["ap-northeast-1a", "ap-northeast-1c","ap-northeast-1d"]

# EC2 Instance Configuration
ami_id        = "ami-01ead1eca9a200e01"
instance_type = "t3.micro"
key_name      = "test_okome_ec2"

# ECS Configuration
execution_role_arn = "arn:aws:iam::617212483723:role/aws-service-role/ecs.amazonaws.com/AWSServiceRoleForECS"
task_role_arn      = "arn:aws:iam::617212483723:role/ecsTaskExecutionRole"
container_image    = "nginx:latest"

# S3 Configuration
# name_suffix = "test"
# topic_name  = "prod-test"
