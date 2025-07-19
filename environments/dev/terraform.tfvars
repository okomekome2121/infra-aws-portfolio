
# VPC Configuration
cidr_block           = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
availability_zones = ["ap-northeast-1a", "ap-northeast-1c"]

# EC2 Instance Configuration
ami_id        = "ami-01ead1eca9a200e01"
instance_type = "t3.micro"
key_name      = "test_okome_ec2"

# ECS Configuration
execution_role_arn = "arn:aws:iam::123456789012:role/ecsExecutionRole"
task_role_arn      = "arn:aws:iam::123456789012:role/ecsTaskRole"
container_image    = "nginx:latest"