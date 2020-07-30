aws_region                             = "ap-northeast-1"
prefix                                 = "jihyungsong"

vpc1_cidr_block                        = "10.0.0.0/16"
vpc2_cidr_block                        = "20.0.0.0/16"

vpc1_subnets                           = [
  {
      availability_zone                = "ap-northeast-1a",
      cidr                             = "10.0.1.0/24",
  },
  {
     availability_zone                 = "ap-northeast-1c",
     cidr                              = "10.0.2.0/24"
  } 
]

vpc2_subnets                           = [
  {
      availability_zone                = "ap-northeast-1a",
      cidr                             = "20.0.1.0/24",
  },
  {
     availability_zone                 = "ap-northeast-1c",
     cidr                              = "20.0.2.0/24"
  } 
]

security_group_http_cidr               = ["0.0.0.0/0"]
security_group_ssh_cidr                = ["0.0.0.0/0"]

launch_template_image_id               = "ami-09ec0130fb359d3e9"
launch_template_instance_type          = "t3.micro"
launch_template_keypair_name           = "jhsong-tera-key"
launch_template_userdata_file          = "userdata.sh"

auto_scaling_group_min_size            = 1
auto_scaling_group_max_size            = 4
auto_scaling_group_desired_capacity    = 2

