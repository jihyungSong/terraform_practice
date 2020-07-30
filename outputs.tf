output "vpc1_id" {
    value       =       module.vpc1.vpc_id
}

output "vpc2_id" {
    value       =       module.vpc2.vpc_id
}

output "vpc1_name" {
    value       =       module.vpc1.vpc_name
}

output "vpc2_name" {
    value       =       module.vpc2.vpc_name
}

output "vpc1_subnet_ids" {
    value       =       module.vpc1.vpc_subnet_ids
}

output "vpc2_subnet_ids" {
    value       =       module.vpc2.vpc_subnet_ids
}

output "vpc1_elb_sg_id" {
    value       =       module.vpc1.vpc_elb_sg_id
}

output "vpc1_webserver_sg_id" {
    value       =       module.vpc1.vpc_webserver_sg_id

}

output "vpc1_admin_sg_id" {
    value       =       module.vpc1.vpc_admin_sg_id

}

output "vpc2_elb_sg_id" {
    value       =       module.vpc2.vpc_elb_sg_id

}

output "vpc2_webserver_sg_id" {
    value       =       module.vpc2.vpc_webserver_sg_id

}

output "vpc2_admin_sg_id" {
    value       =       module.vpc2.vpc_admin_sg_id

}

output "vpc1_alb_dns_name" {
    value       =       module.vpc1.alb_dns_name
}

output "vpc2_alb_dns_name" {
    value       =       module.vpc2.alb_dns_name
}