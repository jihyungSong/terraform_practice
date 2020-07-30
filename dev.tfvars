aws_region                             = "ap-southeast-1"
prefix                                 = "skuser27"

vpc1_cidr_block                        = "10.0.0.0/16"
vpc2_cidr_block                        = "20.0.0.0/16"

vpc1_subnets                           = [
  {
      availability_zone                = "ap-southeast-1a",
      cidr                             = "10.0.1.0/24",
  },
  {
     availability_zone                 = "ap-southeast-1c",
     cidr                              = "10.0.2.0/24"
  } 
]

vpc2_subnets                           = [
  {
      availability_zone                = "ap-southeast-1a",
      cidr                             = "20.0.1.0/24",
  },
  {
     availability_zone                 = "ap-southeast-1c",
     cidr                              = "20.0.2.0/24"
  } 
]

security_group_http_cidr               = ["0.0.0.0/0"]
security_group_ssh_cidr                = ["0.0.0.0/0"]

launch_template_image_id               = "ami-051a0af4be6c9c192"
launch_template_instance_type          = "t2.micro"
launch_template_keypair_name           = "skuser27-key"
launch_template_userdata_file          = "userdata.sh"

auto_scaling_group_min_size            = 1
auto_scaling_group_max_size            = 4
auto_scaling_group_desired_capacity    = 2

