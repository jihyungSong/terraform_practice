variable "aws_region" {}

variable "prefix" {}

variable "vpc1_name" {
    default    =    "vpc1"
}

variable "vpc2_name" {
    default    =    "vpc2"
}

variable "vpc1_cidr_block" {}
variable "vpc2_cidr_block" {}

variable "vpc1_subnets" {}
variable "vpc2_subnets" {}

variable "s3_bucket_name" {
    default    =    "bucket"
}

variable "security_group_http_cidr" {}
variable "security_group_ssh_cidr" {}

variable "launch_template_image_id" {}
variable "launch_template_instance_type" {}
variable "launch_template_keypair_name" {}
variable "launch_template_userdata_file" {}

variable "auto_scaling_group_min_size" {}
variable "auto_scaling_group_max_size" {}
variable "auto_scaling_group_desired_capacity" {}
