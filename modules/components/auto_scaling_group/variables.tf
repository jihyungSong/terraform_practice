variable "prefix" {
    default    =    "default"
}

variable "subnet_ids" {} 

variable "max_size" {
    default    =    4
}

variable "min_size" {
    default    =    1
}

variable "desired_capacity" {
    default    =    2
}

variable "target_group_arns" {}

variable "health_check_type" {
   default    =    "ELB"
}

variable "health_check_grace_period" {
   default    =    300
}

variable "launch_template_id" {}
