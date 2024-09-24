# User can decide Peering required or not 
####### IF Required
# 1. They should provide the ID to peer
# 2. if not giving we consider default VPC

### requestor -> your project (roboshop or Ecommerce)
### acceptor  -> The ID they provided (or) default.

resource "aws_vpc_peering_connection" "requestor" {
  # if var.peering_required is true, count will be one and will loop once, else it dosen't loop 
  count = var.peering_required ? 1 : 0
  #peer_owner_id = var.peer_owner_id -> this is optional
  # here, if peer_vpc_id is provied it will take the value, else it will go with default vpc in your account
  peer_vpc_id   = var.vpc_peer_info == "" ? data.aws_vpc.details.id : var.vpc_peer_info
  vpc_id        = aws_vpc.main.id
  # if value is passed to (var.vpc_peer_info) then acceptor should accept, else default vpc in our account is automatically accepted with the auto_approve condition written
  auto_accept = var.vpc_peer_info == "" ? true : false
  tags = merge(
    var.common_tags,
    var.vpc_peering_tags,
    {
        Name = "${local.name}"
    }
  )
}


resource "aws_route" "acceptor" { # this is only in case of a default vpc
# count for checking weather both the conditions are true and only run when they are true
   count = var.peering_required && var.vpc_peer_info == "" ? 1 : 0
# get the route table data if the default route_table 
   route_table_id = data.aws_route_table.detail.id
# add the destination route to the default route table for the traffic o flow   
   destination_cidr_block = var.vpc_cidr 
# Also, add the internet gateway id    
   vpc_peering_connection_id = aws_vpc_peering_connection.requestor[0].id 
}


resource "aws_route" "public_peering" { # this is only in case of a default vpc
# count for checking weather both the conditions are true and only run when they are true
   count = var.peering_required && var.vpc_peer_info == "" ? 1 : 0
# get the route table data if the default route_table 
   route_table_id = aws_route_table.publicrt.id
# add the destination route to the default route table for the traffic o flow   
   destination_cidr_block = data.aws_vpc.details.cidr_block 
# Also, add the internet gateway id    
   vpc_peering_connection_id = aws_vpc_peering_connection.requestor[0].id 
}

resource "aws_route" "private_peering" { # this is only in case of a default vpc
# count for checking weather both the conditions are true and only run when they are true
   count = var.peering_required && var.vpc_peer_info == "" ? 1 : 0
# get the route table data if the default route_table 
   route_table_id = aws_route_table.privatert.id
# add the destination route to the default route table for the traffic o flow   
   destination_cidr_block = data.aws_vpc.details.cidr_block 
# Also, add the internet gateway id    
   vpc_peering_connection_id = aws_vpc_peering_connection.requestor[0].id 
}


resource "aws_route" "database_peering" { # this is only in case of a default vpc
# count for checking weather both the conditions are true and only run when they are true
   count = var.peering_required && var.vpc_peer_info == "" ? 1 : 0
# get the route table data if the default route_table 
   route_table_id = aws_route_table.databasert.id
# add the destination route to the default route table for the traffic o flow   
   destination_cidr_block = data.aws_vpc.details.cidr_block 
# Also, add the internet gateway id    
   vpc_peering_connection_id = aws_vpc_peering_connection.requestor[0].id 
}


