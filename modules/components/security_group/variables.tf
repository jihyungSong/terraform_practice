variable "prefix" {
    description =   "Security group naming prefix"
}

variable "http_cidrs" {
    description =   "Source CIDR blocks for HTTP Access"
    type        =   list
    default     =   ["0.0.0.0/0"]
}

variable "ssh_cidrs" {
    description =   "Source CIDR blocks for SSH Access"
    type        =   list
}

variable "vpc_id" {
    description =   "Security group will be in target vpc"
}

