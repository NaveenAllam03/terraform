terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws" 
      version = "5.66.0"  # this is provider version not terraform, this is actively developed by aws
    }
  }
}

provider "aws" {
  # Configuration options
}