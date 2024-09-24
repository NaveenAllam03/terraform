# 1. To get all avaliablility zones in given AWS region
data "aws_availability_zones" "available" {
  state = "available"
}

# 2. To get the default VPC_ID, in case the peer vpc_ID is not provided
data "aws_vpc" "details" {                                                                                                                            
  default = true                                                                                                                                      
}

data "aws_route_table" "detail" {
  vpc_id = data.aws_vpc.details.id 
}