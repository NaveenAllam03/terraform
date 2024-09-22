resource "aws_instance" "using_for_each" {
  for_each = var.instance_names
  #count         = length(var.instance_name)
  ami           = var.ami_id
  instance_type = each.value

  tags = {
    Name = each.key
  }
}

resource "aws_route53_record" "www" {
  #count = 11
  #count         = length(var.instance_name)
  for_each =  aws_instance.using_for_each #var.instance_names
  zone_id  = var.zone_id
  name     = "${each.key}.${var.domain_name}" #interpolation
  type     = "A"
  ttl      = 1
  records  = [each.key == "web" ? each.value.public_ip : each.value.private_ip]
}