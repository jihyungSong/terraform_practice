variable "aws_region" {
    description =   "AWS Region"
}

variable "prefix" {
    description =   "VPC Prefix"
}

variable "vpc_name" {
    default     =   "vpc"
}

variable "vpc_cidr_block" {
    default     =   "10.0.0.0/16"
}

variable "vpc_subnets" {
    description     =   "Subnet list to use for network to connect to the internet in this VPC"
    type            =   list
}

variable "ssh_cidr" {}
variable "http_cidr" {}

variable "image_id" {}
variable "instance_type" {}
variable "iam_instance_profile_arn" {}
variable "keypair_name" {}
variable "userdata_file" {}

variable "min_size" {}
variable "max_size" {}
variable "desired_capacity" {}
