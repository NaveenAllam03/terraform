

# data "aws_ami" "centos8" {
#   owners           = ["973714476881"]
#   most_recent      = true
#   executable_users = ["self"]

#   filter {
#     name   = "name"
#     values = ["Centos-8-DevOps-Practice-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   filter {
#     name   = "root-device-type"
#     values = ["EBS"]
#   }

# }

# data "aws_ami" "latest_amazon_linux" {
#   most_recent = true
#   owners      = ["amazon"]

#   filter {
#     name   = "name"
#     values = ["amzn2-ami-hvm-*-x86_64-gp2"]
#   }
# }

data "aws_ami" "ubuntu_latest" {
  owners =["099720109477"]
  most_recent = true

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-arm64-server-20240801"]
    # The value here should entered properly, aws throws a error if it is not mentioned properly
  }
}

   