# VPC
resource "aws_vpc" "vpc" {
    cidr_block              =   var.vpc_cidr_block
    enable_dns_support      =   "true"
    enable_dns_hostnames    =   "true"
    
    tags = map(
            "Name", "${var.vpc_prefix}-${var.vpc_name}",
            "Managed_by", "terraform",
    )
}

# Subnet
resource "aws_subnet" "subnet" {
    count               =   length(var.vpc_subnets)
    vpc_id              =   aws_vpc.vpc.id
    availability_zone   =   lookup(var.vpc_subnets[count.index], "availability_zone")
    cidr_block          =   lookup(var.vpc_subnets[count.index], "cidr")

    tags = map(
            "Name", "${var.vpc_prefix}-${var.vpc_name}-subnet-${count.index}",
            "Managed_by", "terraform",
    )
}

# Gateway
resource "aws_internet_gateway" "vpc_igw" {
    vpc_id              =   aws_vpc.vpc.id

    tags = {
        Name            =   "${var.vpc_prefix}-${var.vpc_name}-igw"
        Managed_by      =   "terraform"
    }
}

# Route table
resource "aws_route_table" "vpc_rtable" {
    vpc_id              =   aws_vpc.vpc.id

    tags = {
        Name            =   "${var.vpc_prefix}-${var.vpc_name}-rt"
        Managed_by      =   "terraform"
    }
}

# Route Add
resource "aws_route" "internet_gateway_route" {
    route_table_id             =    aws_route_table.vpc_rtable.id
    destination_cidr_block     =    "0.0.0.0/0"
    gateway_id                 =    aws_internet_gateway.vpc_igw.id
}

resource "aws_route_table_association" "vpc_rtable_association" {
    count           =   length(var.vpc_subnets)

    subnet_id       =   aws_subnet.subnet.*.id[count.index]
    route_table_id  =   aws_route_table.vpc_rtable.id
}

resource "aws_vpc_endpoint" "s3_endpoint" {
    vpc_id           = aws_vpc.vpc.id
    service_name     = "com.amazonaws.${var.region_name}.s3"
    route_table_ids  = [
        aws_route_table.vpc_rtable.id,
    ]
    
    tags = {
      Name          =   "${var.vpc_prefix}-${var.vpc_name}-endpoint"
      Managed_by    =   "terraform"
  }
}
