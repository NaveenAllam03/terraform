# creating variables for main.tf file
variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/20"
}

variable "dns_hostnames" {
    type = bool
    default = true
}

variable "common_tags" {
    type = map
    default = {} # this represents optional 
    # 1. you can overwrite this tags if you need, If you don't default values will ne assigned 

}

variable "vpc_tags" { # Resource specific tags
    type = map 
    default = {} # this represents optional 
    # 1. you can overwrite this tags if you need, If you don't default values will ne assigned
}

variable "igw_tags" {
    type = map
    default = {} # this represents optional 
    # 1. you can overwrite this tags if you need, If you don't default values will ne assigned 

}

variable "project_name" {
    type = string 

}

variable "environment" {
    type = string
}

variable "public_subnets_cidr" {
    type = list 
    validation {
        condition = length(var.public_subnets_cidr) == 2
        error_message = "only 2 values are allowed"
    }
}

variable "public_subnet_tags" {
    type = map 
    default = {}
}

variable "private_subnets_cidr" {
    type = list 
    validation {
        condition = length(var.private_subnets_cidr) == 2
        error_message = "only 2 values are allowed"
    }
}

variable "private_subnet_tags" {
    type = map 
    default = {}
}

variable "database_subnets_cidr" {
    type = list 
    validation {
        condition = length(var.database_subnets_cidr) == 2
        error_message = "only 2 values are allowed"
    }
}

variable "database_subnet_tags" {
    type = map 
    default = {}
}