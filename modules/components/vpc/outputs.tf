output "vpc_id" {
    description =   "The ID of VPC"
    value       =   aws_vpc.vpc.id
}

output "vpc_name" {
    description =   "The name of VPC"
    value       =   aws_vpc.vpc.tags.Name
}

output "vpc_cidr_block" {
    description =   "CIDR Block of VPC to use for network"
    value       =   aws_vpc.vpc.cidr_block
}

output "vpc_subnet_ids" {
    description =   "The ID list of subnets in this VPC"
    value       =   aws_subnet.subnet.*.id
}

output "vpc_route_table_ids" {
    description =   "The ID list of route tables for network in this VPC"
    value       =   aws_route_table.vpc_rtable.*.id
}

