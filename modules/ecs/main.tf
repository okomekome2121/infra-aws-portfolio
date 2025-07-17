resource "aws_ecs_cluster" "test_ecs" {
  name = "example-cluster"
}

resource "aws_iam_role" "ecs_task_execution_role" {
  #name = "ecsTaskExecutionRole"
  name = "ecs-task-execution-role-${var.environment}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_ecs_task_definition" "test_ecs" {
  family                   = "example-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([{
    name      = "nginx"
    image     = "nginx:latest"
    essential = true
    portMappings = [{
      containerPort = 80
      hostPort      = 80
      protocol      = "tcp"
    }]
  }])
}

resource "aws_ecs_service" "test_ecs" {
  name            = "example-service"
  cluster         = aws_ecs_cluster.test_ecs.id
  task_definition = aws_ecs_task_definition.test_ecs.arn
  launch_type     = "FARGATE"
  desired_count   = 2

  network_configuration {
    subnets         = [for subnet in var.subnet_id : subnet]
    #security_groups = [aws_security_group.ecs_service.id]
    assign_public_ip = true
  }

  depends_on = [aws_iam_role_policy_attachment.ecs_task_execution]
}
