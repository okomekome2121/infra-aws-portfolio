resource "aws_lb" "dev_test" {
  name               = "${var.environment}-test"
  internal           = var.internal
  load_balancer_type = "application"
  security_groups    = var.security_group_ids
  subnets            = var.subnet_ids

  enable_deletion_protection = var.enable_deletion_protection

  tags = {
    Name        = "${var.environment}-test"
    Environment = var.environment
  }
}

resource "aws_lb_target_group" "dev_test" {
  name        = "${var.environment}-test-tg"
  port        = var.target_port
  protocol    = var.target_protocol
  vpc_id      = var.vpc_id
  target_type = "instance"

  health_check {
    path                = var.health_check_path
    protocol            = var.health_check_protocol
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    matcher             = "200"
  }

  tags = {
    Name        = "${var.environment}-test-tg"
    Environment = var.environment
  }
}

resource "aws_lb_target_group_attachment" "test_target_ec2" {
  target_group_arn = aws_lb_target_group.dev_test.arn
  target_id        = var.instance_id
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.dev_test.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.dev_test.arn
  }
}

