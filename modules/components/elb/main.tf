resource "aws_lb_target_group" "target_group" {
    name             =    "${var.prefix}-target-group"   
    port             =    var.port
    protocol         =    var.protocol
    vpc_id           =    var.vpc_id
}

resource "aws_lb" "alb" {
  name               = "${var.prefix}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_groups
  subnets            = var.subnet_ids

  tags = {
    Managed_by = "Terraform"
  }
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = var.port
  protocol          = var.protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}
