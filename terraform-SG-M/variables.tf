variable "project_name" {

}

variable "sg_description" {
    default = ""
    type = string
}


# variable "project_name" { 

# }

variable "environment" {
  
}

variable "sg_name"  {

}

variable "common_tags" {
    default = {}
    type = map
}

variable "sg_tags" {
    default ={}
    type = map
}

variable "vpc_id" {

}

variable "sg_ingress_rules" {
     type = list 
     default = []  # [] represents list 
}