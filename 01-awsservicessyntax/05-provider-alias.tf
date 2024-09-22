##########
# This provider alias is useful when you want same configurations at different locations simultaneously
#  code duplication will happen here to achive the provider-alias output

provider "aws" {
    alias = "virginia" # you can mention any location
    region = "give region_id of virginia"
}

provider "aws" {
    alias = "ohio" # you can mention any location
    region = "give region_id of ohio"
}

provider "aws" {
    alias = "mumbai" # you can mention any location
    region = "give region_id of mumbai"
}
####################### example to show hoe to use provider-alias ###################################
resource "aws_s3_bucket" "syntax01" {
  provider = aws.virginia # any location you want to create s3 bucket simultaneously   
  bucket = "for-syntax"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "syntax01" {
  provider = aws.ohio # any location you want to create s3 bucket simultaneously   
  bucket = "for-syntax"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

