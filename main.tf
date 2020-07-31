provider "aws"{
    region                      =     var.aws_region
}

module "iam_role" {
    /*
    Module iam_role
      - Create Instance Role for access S3 Bucket
    */
    
    source                      =   "./modules/components/iam"
    
    prefix                      =   var.prefix
}

module "s3" {
    /*
    Module s3
      - Create S3 Bucket only. not setting anything.
    */
    
    source                      =   "./modules/components/s3"

    prefix                      =   var.prefix
    bucket                      =   var.s3_bucket_name
}

module "vpc1" {
    /*
    Module vpc1
      - Create VPC/Subnet/InternetGatway/RouteTable/Endpoint
      - Create Security Group
      - Create TargetGroup/ALB
      - Create LaunchTemplate/AutoScalingGroup
    */
    
    source                      =   "./modules/web_vpc"

    prefix                      =   var.prefix
    aws_region                  =   var.aws_region
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
    /*
    Module vpc2
      - Same to VPC1
      - Create VPC/Subnet/InternetGatway/RouteTable/Endpoint
      - Create Security Group
      - Create TargetGroup/ALB
      - Create LaunchTemplate/AutoScalingGroup
    */
    
    source                      =   "./modules/web_vpc"

    prefix                      =   var.prefix
    aws_region                  =   var.aws_region
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

module "vpc_peer" {
    /*
    Module vpc_peer
      - Create VPC Peering between VPC1 and VPC2
      - Add Route to connect VPC1 and VPC2
      - Add Security Group Rule to allow VPC1 and VPC2
    */
    
    source                      =   "./modules/vpc_peer"

    prefix                      =   var.prefix
    requester_vpc_id            =   module.vpc1.vpc_id
    accepter_vpc_id             =   module.vpc2.vpc_id

    requester_vpc_cidr          =   module.vpc1.vpc_cidr
    accepter_vpc_cidr           =   module.vpc2.vpc_cidr

    req_vpc_route_table_id      =   module.vpc1.vpc_route_table_id
    acc_vpc_route_table_id      =   module.vpc2.vpc_route_table_id
    
    req_vpc_security_group_id   =   module.vpc1.vpc_admin_sg_id
    acc_vpc_security_group_id   =   module.vpc2.vpc_admin_sg_id
}
