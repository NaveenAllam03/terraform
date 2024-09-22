#################### variable-1 #############################
variable "security_group" {
  type    = string
  default = "allow all"
}
#################### variable-2 #############################
variable "port_no" {
  type    = number
  default = 0
}
#################### variable-3 #############################
# variable "security_group" {
#     type = "string"
#     default = "allow all"
# }
#################### variable-4 #############################
# variable "tags" {
#   type = map(any)
#   default = {
#     name         = "hello"
#     project_name = "roboshop"
#     ENV          = "Dev"
#     component    = "catalogue"
#     terraform    = "true"
#   }
# }

variable "ami_id" {
  type    = string
  default = "ami-0b4f379183e5706b9"
}

variable "instance_name" {
  type    = list(any)
  default = ["web", "catalogue", "redis", "mongodb", "mysql", "cart", "shipping", "payment", "rabbitmq", "user", "dispatch"]
}

variable "zone_id" {
  type    = string
  default = "Z07924103PH7MH5UHMSZF"
}

variable "domain_name" {
  type    = string
  default = "hanumanhostels.online"
}

# Tags play a key role in filteration purpose in real-time, Tags are very important
variable "tags" { # this is how you define tags 
  type = map      
  default = {
    name = "terraform_practice"
    project = "roboshop"
    environment = "dev"
    component = "web"  
  }
}