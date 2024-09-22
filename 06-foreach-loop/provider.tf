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
   backend "s3" {
    bucket = "ncabucket-01"
    key = "foreach"
    region = "us-east-1"
    dynamodb_table = "ncatable01"
  }
}

provider "aws" {
  region = "us-east-1"
}