output "vpc_id" {
    value       =       module.vpc.vpc_id
}

output "vpc_name" {
    value       =       module.vpc.vpc_name
}

output "vpc_cidr" {
    value       =       module.vpc.vpc_cidr_block
}

output "vpc_subnet_ids" {
    value       =       module.vpc.vpc_subnet_ids
}

output "vpc_route_table_id" {
    value       =       module.vpc.vpc_route_table_id
}

output "vpc_elb_sg_id" {
    value       =       module.vpc_security_group.elb_sg_id
}

output "vpc_webserver_sg_id" {
    value       =       module.vpc_security_group.webserver_sg_id
}

output "vpc_admin_sg_id" {
    value       =       module.vpc_security_group.admin_access_sg_id
}

