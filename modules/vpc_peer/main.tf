resource "aws_vpc_peering_connection" "vpc_connection" {
    peer_vpc_id                 =   var.accepter_vpc_id
    vpc_id                      =   var.requester_vpc_id
    auto_accept                 =   true

    accepter {
        allow_remote_vpc_dns_resolution = true
    }

    requester {
        allow_remote_vpc_dns_resolution = true
    }
    
    tags = {
        Name          =   "${var.prefix}-vpc-conn"
        Managed_by    =   "terraform"
    }
}

resource "aws_route" "requester_vpc_route" {
    route_table_id             =    var.req_vpc_route_table_id
    destination_cidr_block     =    var.accepter_vpc_cidr
    vpc_peering_connection_id  =    aws_vpc_peering_connection.vpc_connection.id
    # depends_on                 =    ["aws_vpc_peering_connection.vpc_connection"]
}

resource "aws_route" "accpeter_vpc_route" {
    route_table_id             =    var.acc_vpc_route_table_id
    destination_cidr_block     =    var.requester_vpc_cidr
    vpc_peering_connection_id  =    aws_vpc_peering_connection.vpc_connection.id
    # depends_on                 =    ["aws_vpc_peering_connection.vpc_connection"]
}

resource "aws_security_group_rule" "allow_req_vpc_cidr" {
    type                       =    "ingress"
    from_port                  =    0
    to_port                    =    65535
    protocol                   =    -1
    cidr_blocks                =    [var.accepter_vpc_cidr]
    security_group_id          =    var.req_vpc_security_group_id
}

resource "aws_security_group_rule" "allow_acc_vpc_cidr" {
    type                       =    "ingress"
    from_port                  =    0
    to_port                    =    65535
    protocol                   =    -1
    cidr_blocks                =    [var.requester_vpc_cidr]
    security_group_id          =    var.acc_vpc_security_group_id
}
