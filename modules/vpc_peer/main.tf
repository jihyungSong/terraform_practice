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
}

resource "aws_route" "requester_vpc_route" {
    route_table_id             =    var.req_vpc_route_table_id
    destination_cidr_block     =    var.accepter_vpc_cidr
    vpc_peering_connection_id  =    aws_vpc_peering_connection.vpc_connection.id
    depends_on                 =    ["aws_vpc_peering_connection.vpc_connection"]
}

resource "aws_route" "accpeter_vpc_route" {
    route_table_id             =    var.acc_vpc_route_table_id
    destination_cidr_block     =    var.requester_vpc_cidr
    vpc_peering_connection_id  =    aws_vpc_peering_connection.vpc_connection.id
    depends_on                 =    ["aws_vpc_peering_connection.vpc_connection"]
}
