output "elb_sg_id" {
    description =   "The ID of Security Group for ELB that service HTTP"
    value       =   aws_security_group.elb_security_group.id
}

output "webserver_sg_id" {
    description =   "The ID of Security Group for Web Server"
    value       =   aws_security_group.webserver_security_group.id
}

output "admin_access_sg_id" {
    description =   "The ID of Security Group to access from admin through SSH"
    value       =   aws_security_group.admin_security_group.id
}

