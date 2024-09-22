
# 1. VPC creation 
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

# 2. Internet Gateway Creation
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

# 3. public subnet creation
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

# 4. private subnet creation
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

# 4. database subnet creation
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