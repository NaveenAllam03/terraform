Two types of provisioners in Terraform
1. local-exec
2. remote-exec
 
###### Start local-exec Syntax ######

--> local is where your terraform command applied

resource "aws_instance" "server" {
    ami_id =
    instance_type =

    tags = {
        name = "provisioner"
    }
}

provisioner "local-exec" {
    command = "echo ${self.private_ip} > inventory"
} 

1. when terraform creates the resources, using local-exec we can send the required information to other tools.
2. local-exec basically prints the local_ip and sends that ip to Ansible inventory

###### End of local-exec ######

###### Start remote-exec Synatx ######
--> you should login-in first for remote-exec
--> Then you can run anything inside the server

resource "aws_instance" "server" {
    ami_id =
    instance_type =

    tags = {
        name = "provisioner"
    }

    provisioner "local-exec" {
    command = "echo ${self.private_ip} > inventory"
  }

    connection {
    type = "ssh"
    user = "centos"
    password = DevOps321"
    host = self.public_ip
  }

    provisioner "remote-exec" {
        inline = [
            "sudo yum install nginx -y"
            "sudo systemctl start nginx"
        ]
    }
}

 
