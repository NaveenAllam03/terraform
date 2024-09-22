# This is basic version of writing a resource there will be many other options which are mandatory and optional

resource "aws_instance" "catalogue" {  
    ami           = "ami-0b4f379183e5706b9"
    instance_type = "t2.micro"
    # many more optional fields
    tags = {
        Name = "Practice"
    }
    user_data =<<-EOF 
      !#/bin/bash
      sudo apt-get update
      sudo apt-get install nginx -y
      sudo systemctl start nginx
      sudo systemctl enable nginx
    EOF  
}