provider "aws"{
    region                      =     var.aws_region
}

module "iam_role" {
    source                      =   "./modules/components/iam"
    
    prefix                      =   var.prefix
}

module "s3" {
    source                      =   "./modules/components/s3"

    prefix                      =   var.prefix
    bucket                      =   var.s3_bucket_name
}

module "vpc1" {
    source                      =   "./modules/web_vpc"

    prefix                      =   var.prefix
    vpc_name                    =   var.vpc1_name
    vpc_cidr_block              =   var.vpc1_cidr_block
    vpc_subnets                 =   var.vpc1_subnets

    ssh_cidr                    =   var.security_group_ssh_cidr
    http_cidr                   =   var.security_group_http_cidr 

    iam_instance_profile_arn    =   module.iam_role.s3_access_instance_profile_arn
    image_id                    =   var.launch_template_image_id
    instance_type               =   var.launch_template_instance_type
    keypair_name                =   var.launch_template_keypair_name
    userdata_file               =   var.launch_template_userdata_file

    min_size                    =   var.auto_scaling_group_min_size
    max_size                    =   var.auto_scaling_group_max_size
    desired_capacity            =   var.auto_scaling_group_desired_capacity
}

module "vpc2" {
    source                      =   "./modules/web_vpc"

    prefix                      =   var.prefix
    vpc_name                    =   var.vpc2_name
    vpc_cidr_block              =   var.vpc2_cidr_block
    vpc_subnets                 =   var.vpc2_subnets

    ssh_cidr                    =   var.security_group_ssh_cidr
    http_cidr                   =   var.security_group_http_cidr

    iam_instance_profile_arn    =   module.iam_role.s3_access_instance_profile_arn
    image_id                    =   var.launch_template_image_id
    instance_type               =   var.launch_template_instance_type
    keypair_name                =   var.launch_template_keypair_name
    userdata_file               =   var.launch_template_userdata_file

    min_size                    =   var.auto_scaling_group_min_size
    max_size                    =   var.auto_scaling_group_max_size
    desired_capacity            =   var.auto_scaling_group_desired_capacity
}

