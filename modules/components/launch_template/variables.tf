variable "prefix" {
    default    =    "default"
}

variable "image_id" {
    default    =    "ami-0cfa3caed4b487e77"    // Ubuntu 18.04 ap-northeast-1
}

variable "instance_type" {
    default    =    "t3.micro"
}

variable "keypair_name" {}

variable "security_group_ids" {
    default    =    []
}

variable "userdata_file" {
    default    =    "userdata_ubuntu.sh"
}

variable "iam_instance_profile_arn" {}
