resource "aws_lb" "dev_test" {
  name               = var.name
  internal           = var.internal
  load_balancer_type = "application"
  security_groups    = var.security_group_ids
  subnets            = var.subnet_ids

  enable_deletion_protection = var.enable_deletion_protection

  tags = {
    Name        = var.name
    Environment = var.environment
  }
}

resource "aws_lb_target_group" "dev_test" {
  name        = "${var.name}-tg"
  port        = var.target_port
  protocol    = var.target_protocol
  #vpc_id      = module.vpc.vpc_id
  target_type = var.vpc_id

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
    Name        = "${var.name}-tg"
    Environment = var.environment
  }
}

resource "aws_lb_target_group_attachment" "ip_targets" {
  for_each           = toset(var.target_ips)
  target_group_arn   = aws_lb_target_group.dev_test.arn
  target_id          = each .value  # IPアドレス
  port               = var.target_port
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

