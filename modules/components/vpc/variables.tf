variable "region_name" {}

variable "vpc_prefix" {
    description = "VPC Prefix. It will be use VPC/Subnet/RouteTable/ETC name"
}

variable "vpc_name" {
    description = "VPC Name."
}

variable "vpc_cidr_block" {
    description =   "VPC cidr network subnet"
    default     =   "10.0.0.0/16"
}

variable "vpc_subnets" {
    type            =   list(object({
        availability_zone = string
        cidr              = string
    }))
}

