
###### 1. VPC creation 
resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  #instance_tenancy = "default" # -> basically telling aws to run my instance on group server or isolated server keep it to default if needed
  enable_dns_hostnames = var.dns_hostnames

  tags = merge(
   var.common_tags,
   var.vpc_tags,
   {
    Name = local.name
   }
 )
}

###### 2. Internet Gateway Creation
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.common_tags,
    var.igw_tags,
    {
    Name = local.name 
    }
  )
}

###### 3. public subnet creation
resource "aws_subnet" "public" {
  count = length(var.public_subnets_cidr)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnets_cidr[count.index]
  availability_zone = local.az_names[count.index]
  tags = merge(
    var.common_tags,
    var.public_subnet_tags,
    {
        Name = "${local.name}-public-${local.az_names[count.index]}"
    }
  )
}

###### 4. private subnet creation
resource "aws_subnet" "private" {
  count = length(var.private_subnets_cidr)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnets_cidr[count.index]
  availability_zone = local.az_names[count.index]
  tags = merge(
    var.common_tags,
    var.private_subnet_tags,
    {
        Name = "${local.name}-private-${local.az_names[count.index]}"
    }
  )
}

###### 5. database subnet creation
resource "aws_subnet" "database" {
  count = length(var.database_subnets_cidr)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.database_subnets_cidr[count.index]
  availability_zone = local.az_names[count.index]
  tags = merge(
    var.common_tags,
    var.database_subnet_tags,
    {
        Name = "${local.name}-database-${local.az_names[count.index]}"
    }
  )
}

###### 6. Elastic IP creation for NAT Gateway
resource "aws_eip" "eip" {
  domain   = "vpc"
}

###### 7. Nat gateway creation 
resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public[0].id

  tags = merge(
    var.common_tags,
    var.aws_nat_gateway_tags,
    {
      Name = "${local.name}"
    }
  )
  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
  # depends_on is used to add the dependencies explicitly
}

###### 8. public route table creation without routes, routes will create seperately
resource "aws_route_table" "publicrt" {
  vpc_id = aws_vpc.main.id  

  tags = merge(
    var.common_tags,
    var.public_rt_tags,
    {
      Name = "${local.name}-publicRT"
    }
  )
}

###### 9. private route table creation without routes, routes will create seperately
resource "aws_route_table" "privatert" {
  vpc_id = aws_vpc.main.id  

  tags = merge(
    var.common_tags,
    var.private_rt_tags,
    {
      Name = "${local.name}-privateRT"
    }
  )
}

###### 10. database route table creation without routes, routes will create seperately
resource "aws_route_table" "databasert" {
  vpc_id = aws_vpc.main.id  

  tags = merge(
    var.common_tags,
    var.database_rt_tags,
    {
      Name = "${local.name}-databaseRT"
    }
  )
}

##### 11. create routes for public route table(Internet_gateway is a must for public subnet for traffic to reach and access the data in the private subnets through NAT gateway we place in public subnets)
resource "aws_route" "publicr" {
  route_table_id              = aws_route_table.publicrt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gw.id
  }

##### 12. create routes for private subnets using NAT_gateway for traffic to flow inside. 
resource "aws_route" "privater" {
  route_table_id              = aws_route_table.privatert.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.natgw.id
  }

##### 13. create routes for database subnet(which is private) using NAT_gateway for traffic to flow inside
resource "aws_route" "databaser" {
  route_table_id         = aws_route_table.databasert.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.natgw.id
  }

##### 14. associationg public subnets with public_routing_table and Public_routes
resource "aws_route_table_association" "publicas" {
  count = length(var.public_subnets_cidr)
  subnet_id      = element(aws_subnet.public[*].id, count.index)
  route_table_id = aws_route_table.publicrt.id
}

##### 15. associationg private subnets with private_routing_table and private_routes
resource "aws_route_table_association" "privateas" {
  count = length(var.private_subnets_cidr)
  subnet_id      = element(aws_subnet.private[*].id, count.index)
  route_table_id = aws_route_table.privatert.id
}

##### 15. associationg database subnets with database_routing_table and database_routes( basically private-subnet configurations)
resource "aws_route_table_association" "databaseas" {
  count = length(var.database_subnets_cidr)
  subnet_id      = element(aws_subnet.database[*].id, count.index)
  route_table_id = aws_route_table.databasert.id
}