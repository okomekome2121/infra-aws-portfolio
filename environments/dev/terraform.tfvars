# Terraform Variables for Dev Environment
environment = "dev"

# VPC Configuration
cidr_block           = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.11.0/24", "10.0.12.0/24"]
availability_zones = ["ap-northeast-1a", "ap-northeast-1c"]

# EC2 Instance Configuration
ami_id        = "ami-01ead1eca9a200e01"
instance_type = "t3.micro"
key_name      = "test_okome_ec2"

# ECS Configuration
execution_role_arn = "arn:aws:iam::617212483723:role/aws-service-role/ecs.amazonaws.com/AWSServiceRoleForECS"
task_role_arn      = "arn:aws:iam::617212483723:role/ecsTaskExecutionRole"
container_image    = "nginx:latest"

# SNS Configuration
#topic_name  = "dev-test"
# name_suffix = "test"

db_password           = "DevPassword123!"
db_subnet_group_name  = "myapp-dev-subnet-group"
