


terraform {
  #required_version = ( <= , >= , < , >) <mention the version here>
  ################
  #           # example 1
  # required_version = "<= 1.6.1 , > 2.1.1."
  #           # example 2
  # required_version = "~> 1.6.0" # increments  the version
  ################
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.66.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}



# this is one way ofproviding specifier and is not mandatory
# this is for version
# terraform {
#   # required version = "<=5.6.0" --> we can mention version here so that it downloads specific one. 
#   required_providers {
#     aws = {
#       source = "hashicorp/aws"
#       version = "5.66.0"  # here we can mention specific version 
#     }
#   }
# }

# 2nd way of specifying a provider
# this is for cloud
# provider "aws" {
# features {}    
#   # Configuration options
# }