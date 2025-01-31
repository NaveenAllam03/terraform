
####################################### count-loop syntax #############################
#
# resource "aws_instance" "catalogue" {
#   ami           = var.ami_id
#   instance_type = var.instance_name == "catalogue" ? "t2.micro" : "t3.micro"
# }

########################################################################################

# resource "aws_instance" "catalogue" {
#   ami           = var.ami_id
#   instance_type = var.instance_name == "catalogue" ? "t2.micro" : "t3.micro"
# }

# IF condition
# condition ? "true" : "false"

resource "aws_instance" "one"{
    ami_id = var.ami_id
    
}
