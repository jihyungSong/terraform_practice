variable "aws_region" {
    description =   "AWS Region"
    default     =   "ap-northeast-1"
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
    default = [
        {
            availability_zone    =   "ap-northeast-1a",
            cidr                 =   "10.0.1.0/24",
        },
        {
            availability_zone    =   "ap-northeast-1c",
            cidr                 =   "10.0.2.0/24",
        }
    ]
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
