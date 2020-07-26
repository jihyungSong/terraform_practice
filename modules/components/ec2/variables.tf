variable "prefix" {
    default     =   "default"
}

variable "subnet_ids" {
    type        =   list
}

variable "instance_type" {
    default     =   "t3.micro"
}

variable "ami_id" {
    default     =   "ami-06ad9296e6cf1e3cf"
}
variable "keypair_name" {}
variable "security_groups" {}

