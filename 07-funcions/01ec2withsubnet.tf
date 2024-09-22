resource "aws_instance" "catalogue" {
  ami                    = "ami-0b4f379183e5706b9"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.SG.id]

  tags = {
    name = "Practice"
  }
} # end of EC2 code 

resource "aws_security_group" "SG" { # start of security group code
  # these fields are mandatory
  name        = var.security_group
  description = "allow all TLS traffic"
  # this fields are optional # OR # If not mentioned, these fileds filled with default values
  # vpc_id        # and many more

  ingress {
    description = "allow all"
    from_port   = var.port_no
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    #IPV6

  }

  egress {
    description = "allow all"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    #IPV6

  }

  # tags = {
  #     name = "allow tls"
  # }
} 