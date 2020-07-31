aws_region                             = "eu-north-1"
prefix                                 = "skuser27"

vpc1_cidr_block                        = "10.0.0.0/16"
vpc2_cidr_block                        = "20.0.0.0/16"

vpc1_subnets                           = [
  {
      availability_zone                = "eu-north-1a",
      cidr                             = "10.0.1.0/24",
  },
  {
     availability_zone                 = "eu-north-1c",
     cidr                              = "10.0.2.0/24"
  } 
]

vpc2_subnets                           = [
  {
      availability_zone                = "eu-north-1a",
      cidr                             = "20.0.1.0/24",
  },
  {
     availability_zone                 = "eu-north-1c",
     cidr                              = "20.0.2.0/24"
  } 
]

security_group_http_cidr               = ["0.0.0.0/0"]
security_group_ssh_cidr                = ["0.0.0.0/0"]

launch_template_image_id               = "ami-0c0cf366403ee23f2"
launch_template_instance_type          = "t3.micro"
launch_template_keypair_name           = "skuser27-eu-north-1"
launch_template_userdata_file          = "userdata.sh"

auto_scaling_group_min_size            = 1
auto_scaling_group_max_size            = 4
auto_scaling_group_desired_capacity    = 2

