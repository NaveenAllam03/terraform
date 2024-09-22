
# variable is mentioning that is variable
# "varibale-name" is the name given to the variable
variable "variable-name" {   
    # you can place variables here 
    # type = string (or) bool (or) number

}

# if started with curly braces{} it is map
# if started with braces[] it is list 

########################## variable-1 #####################################
variable "service_SG" {
    #type = sting # not mandatory to give 
    # it will be a good practice if u give
    default = ""
}
########################## variable-2 #####################################
variable "service_routetable" {
    #type = sting # not mandatory to give 
    # it will be a good practice if u give
    default = ""
}
########################## variable-3 #####################################
variable "service_vpc" {
    #type = sting # not mandatory to give 
    # it will be a good practice if u give
    default = ""
}