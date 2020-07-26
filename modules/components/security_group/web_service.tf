resource "aws_security_group" "elb_security_group" {
  name          = "${var.prefix}-elb-sg"
  vpc_id        = var.vpc_id

  # Outbound ALL
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.prefix}-elb-sg"
    Managed_by  = "terraform"
  }
}

resource "aws_security_group" "webserver_security_group" {
  name          = "${var.prefix}-webserver-sg"
  vpc_id        = var.vpc_id

  # Outbound ALL
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.prefix}-webserver-sg"
    Managed_by  = "terraform"
  }
}

resource "aws_security_group_rule" "http_access_ingress" {
  description                   = "Allow HTTP for ELB"
  cidr_blocks                   = var.http_cidrs
  from_port                     = 80
  to_port                       = 80
  protocol                      = "tcp"
  security_group_id             = aws_security_group.elb_security_group.id
  type                          = "ingress"
}

resource "aws_security_group_rule" "elb_access_ingress" {
  description                   = "Allow ELB Security Group for service"
  source_security_group_id      = aws_security_group.elb_security_group.id
  from_port                     = 80
  to_port                       = 80
  protocol                      = "tcp"
  security_group_id             = aws_security_group.webserver_security_group.id
  type                          = "ingress"
}

