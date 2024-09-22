

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.67.0"
    }
  }

  backend "s3" {
    bucket = "ncabucket-01"
    key = "foreach"
    region = "us-east-1"
    dynamo_table = "ncatable01"
  }
}

provider "aws" {
  region = "us-east-1"
}