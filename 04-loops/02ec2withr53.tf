resource "aws_instance" "server" {
  count = 11
  #count         = length(var.instance_name)
  ami           = var.ami_id
  instance_type = var.instance_name[count.index] == "mysql" || var.instance_name[count.index] == "shipping" || var.instance_name[count.index] == "mangodb" ? "t2.medium" : "t2.micro"

  tags = {
    name = var.instance_name[count.index]
    # used special variable [count.index]
  }
}

resource "aws_route53_record" "www" {
  count = 11
  #count         = length(var.instance_name)
  zone_id = var.zone_id
  name    = "${var.instance_name[count.index]}.${var.domain_name}" #interpolation
  type    = "A"
  ttl     = 1
  records = [var.instance_name[count.index] == "web" ? aws_instance.server[count.index].public_ip : aws_instance.server[count.index].private_ip]
}