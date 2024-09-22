
#   This file should be placed inside the file info which you are creating, So that the statefile created for the resource is stored centrally in the provider storage platform "S3" in case of AWS

# in case of Azure it comes defaultly
####################### this file should be placed in provider.tf file #####################

    # this is a complete file
terraform {
  backend "s3" {
    bucket = "S3 bucket name "
    key    = "LockID - this shoud be the format "
    region = "us-east-1"
    locking = "give the name (or) id of table you created"
  }
}

          ######################### or ################################

#   place this when you already have the provider info
#   backend "s3" {
#     bucket = "S3 bucket name "
#     key    = "LockID - this shoud be the format "
#     region = "us-east-1"
#     locking = "give the name (or) id of table you created"
#   }          