resource "security_group" "SG" {
    # these fields are mandatory
    name         = "allow all"
    description  = "allow all TLS traffic"
    
    # this fields are optional # OR # If not mentioned, these fileds filled with default values

    # vpc_id        # and many more

    ingress {
        Description  = "allow all"
        from_port    = "0"
        to_port      = "0"
        protocol     = "tcp"
        cidr_blocks  = ["0.0.0.0/0"]
       #IPV6

    }

    engress {
        Description  = "allow all"
        from_port    = "0"
        to_port      = "0"
        protocol     = "tcp"
        cidr_blocks  = ["0.0.0.0/0"]
       #IPV6

    }

    # tags = {
    #     name = "allow tls"
    # }
} 