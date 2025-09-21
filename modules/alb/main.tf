# ALB
resource "aws_lb" "this" {
  name               = "${var.project}-${var.environment}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_sg_id]
  subnets            = var.public_subnets

  enable_deletion_protection = false

  tags = {
    Name        = "${var.project}-${var.environment}-alb"
    Environment = var.environment
    Project     = var.project
  }
}

# Target Group
resource "aws_lb_target_group" "this" {
  name        = "${var.project}-${var.environment}-tg"
  port        = var.target_group_port
  protocol    = var.target_group_protocol
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    interval            = 30
    path                = "/health"
    protocol            = var.target_group_protocol
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name        = "${var.project}-${var.environment}-tg"
    Environment = var.environment
    Project     = var.project
  }
}

# Listener HTTP
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.this.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}
