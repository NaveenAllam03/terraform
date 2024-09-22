



variable "common_tags" {
    default = {
        project_name = "roboshop"
        environment = "dev"
        terraform = true
    }
}

variable "vpc_tags" {
    default = {}
}

variable "igw_tags" {
    default = {}
}


variable "project_name" {
    default = "roboshop"

}

variable "environment" {
    default = "dev"

}

variable "public_subnets_cidr" {
    default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "public_subnet_tags" {
    default = {}
}

variable "private_subnets_cidr" {
    default = ["10.0.11.0/24","10.0.12.0/24"]
}

variable "private_subnet_tags" {
    default = {}
}

variable "database_subnets_cidr" {
    default = ["10.0.21.0/24","10.0.22.0/24"]
}

variable "database_subnet_tags" {
    default = {}
}