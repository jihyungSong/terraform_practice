provider "aws"{
    region                      =     var.aws_region
}

module "vpc" { 
    source                      =     "../components/vpc"

    region_name                 =     var.aws_region
    vpc_prefix                  =     var.prefix
    vpc_name                    =     var.vpc_name
    vpc_cidr_block              =     var.vpc_cidr_block
    vpc_subnets                 =     var.vpc_subnets
}

module "vpc_security_group" {
    source                      =     "../components/security_group"
    
    prefix                      =     module.vpc.vpc_name
    http_cidrs                  =     var.http_cidr
    ssh_cidrs                   =     var.ssh_cidr
    vpc_id                      =     module.vpc.vpc_id
}

module "vpc_elb" {
    source                      =     "../components/elb"
    
    prefix                      =     module.vpc.vpc_name
    vpc_id                      =     module.vpc.vpc_id

    security_groups             =     [module.vpc_security_group.elb_sg_id]
    subnet_ids                  =     module.vpc.vpc_subnet_ids
}

module "launch_template" {
    source                      =    "../components/launch_template"
    
    prefix                      =    module.vpc.vpc_name
    image_id                    =    var.image_id
    instance_type               =    var.instance_type
    keypair_name                =    var.keypair_name
    iam_instance_profile_arn    =    var.iam_instance_profile_arn
    security_group_ids          =    [module.vpc_security_group.webserver_sg_id, module.vpc_security_group.admin_access_sg_id]
    userdata_file               =    var.userdata_file
}

module "auto_scaling_group" {
    source                      =    "../components/auto_scaling_group"

    prefix                      =    module.vpc.vpc_name
    subnet_ids                  =    module.vpc.vpc_subnet_ids
    min_size                    =    var.min_size
    max_size                    =    var.max_size
    desired_capacity            =    var.desired_capacity
    target_group_arns           =    [module.vpc_elb.target_group_arn]
    launch_template_id          =    module.launch_template.launch_template_id
}

/*
module "vpc_ec2_instance" {
    source                      =   "../components/ec2"
    
    prefix                      =   var.prefix
    subnet_ids                  =   module.vpc1.vpc_subnet_ids
    ami_id                      =   var.ubuntu_1804
    keypair_name                =   var.ec2_keypair_name
    security_groups             =   [module.vpc1_security_group.webserver_sg_id, module.vpc1_security_group.admin_access_sg_id]
}
*/

