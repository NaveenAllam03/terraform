variable "instance_names" {
  type = map
  default = {
    web       = "t2.micro"
    cart      = "t2.micro"
    shipping  = "t2.medium"
    payments  = "t2.micro"
    user      = "t2.micro"
    redis     = "t2.micro"
    rabbitmq  = "t2.micro"
    mongodb   = "t2.micro"
    mysql     = "t2.medium"
    catalogue = "t2.medium"
    dispatch  = "t2.micro"
  }
}

variable "ami_id" {
  default = "ami-0b4f379183e5706b9"
}

variable "zone_id" {
  default = "Z07924103PH7MH5UHMSZF"
}

variable "domain_name" {
  default = "hanumanhostels.online"
}