output "azs_avaliable" {
    value = local.az_names
}

output "vpc_id" {
    value = aws_vpc.main.id
}
