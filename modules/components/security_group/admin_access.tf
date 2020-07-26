resource "aws_security_group" "admin_security_group" {
  name        = "${var.prefix}-admin-sg"
  vpc_id      = var.vpc_id

  # Outbound ALL
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.prefix}-admin-sg"
    Managed_by  = "terraform"
  }
}

resource "aws_security_group_rule" "admin_access_ingress" {
  description                   = "Allow SSH for admin"
  cidr_blocks                   = var.ssh_cidrs
  from_port                     = 22
  to_port                       = 22
  protocol                      = "tcp"
  security_group_id             = aws_security_group.admin_security_group.id
  type                          = "ingress"
}

