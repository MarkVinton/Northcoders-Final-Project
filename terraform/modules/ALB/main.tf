resource "aws_lb" "LB" {
  name               = "${var.cluster_name}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_security_group_id]
  subnets            = var.public_subnets

  enable_deletion_protection = false

  tags = {
    Name = "${var.cluster_name}-ALB"
  }
}

resource "aws_lb_target_group" "LB" {
  name     = "${var.cluster_name}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    enabled             = true
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 5
    path                = "/"
    interval            = 30
    protocol            = "HTTP"
    matcher             = "200"
  }

  tags = {
    Name = "${var.cluster_name}-TG"
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.LB.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.LB.arn
  }
}


