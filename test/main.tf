module "roboshop" {
  #source = "../terraform-aws-vpc"
  source       = "git::https://github.com/NaveenAllam03/terraform.git//terraform-aws-vpc?ref=main"
  # // -> are used to seperate the link and use new link in case on need
  # //terraform-aws-vpc -> This is to point to the specific folder in the repository
  # ref=main<branch> or <tag_name> -> for specific branch
  project_name = var.project_name
  environment  = var.environment
  common_tags  = var.common_tags
  vpc_tags     = var.vpc_tags
  # public_subnet
  public_subnets_cidr = var.public_subnets_cidr
  # private_subnet
  private_subnets_cidr = var.private_subnets_cidr
  #database_subnet
  database_subnets_cidr = var.database_subnets_cidr
  peering_required = true
}