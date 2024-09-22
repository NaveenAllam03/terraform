# output "ami_id" {
#   value = data.aws_ami.centos8.id
# }

# output "ami_id" {
#   description = "The latest Amazon Linux 2 AMI ID"
#   value       = data.aws_ami.latest_amazon_linux.id
# }

output "ami_id" {
    value = data.aws_ami.ubuntu_latest.id
}