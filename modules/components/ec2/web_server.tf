resource "aws_instance" "webserver" {
  count                         =   length(var.subnet_ids)
  associate_public_ip_address   =   true
  ami                           =   var.ami_id
  subnet_id                     =   element(var.subnet_ids, count.index)
  instance_type                 =   var.instance_type
  key_name                      =   var.keypair_name
  security_groups               =   var.security_groups

  tags = {
    Name        =   "${var.prefix}-webserver-${count.index}"
    Managed_by  =   "terraform"
  }
}

