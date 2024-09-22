################################       AZURE:       ####################################

If you are using terraform in azure, it very essential to create a resource group first

--> no two resources which every configuration same should not have smae names in terraform
    if you do so terraform throws an error saying duplicate resources.

--> Two important fields in terraform code
    Base:
    1. resources
    2. Data sources   
################################# terraform commands imp ####################################33

1. --> terraform fmt(or)format - keeps code in proper order

2. --> terraform validate - verifies syntax mistakes  

3. --> terraform apply <--auto-approve> --> creates infrastructure without asking

4. --> terraform apply  --> asks permission to create infrastructure through prompt 

5. --> terraform apply -parallelisam<anynumber> --auto-approve --> according to given number 
    this performs the task.

6. --> terraform plan -refresh-only - identifies changes done manually
   
7. --> terraform state show <statefile name> - lists all statefiles
8. --> terraform destroy -target <statefile name> - when you want to destroy a specific statefile.
       -> if you want to delete a S3 bucket then,
            force_destroy = true -> mention this in the S3 resource file.

9. --> terraform import <resource-statefilename> and <resource-serverid> 
       -> if you accidentally deleted any statefile of particular resource, then use the above command



############################# IMP TERRAFORM STATE FILE #################################

-- > whatever you do in terraform, it will store smallest of details, to do that it uses a file 
     that file is called TERRAFORM STATEFILE
     -> for every change made, the statefile is created and existing old file is automaticlly converted as backup 
     by TERRAFORM. 
 -> for every cjange state file is updated.





#############################    resource syntax :     ################################
  resource " mention aws resource name" "name for the mention resource" {
    # arguments for the mentioned resource
      --> arguments can be required or optional
          --> required means mandatory
          --> optional means not-mandatory

 }

 example ec2 resource creation

 resource "awsec2" "sample01" { # name given here is referrence for terraform 
    name      = "test01"        # this name is referrance for aws
    location  = "us-east-1" 
    # name and location are mandatory    

    tags {      # Tags are optional 

    }
 }


 ################################### implicit and explicit dependencies ###########################

 terraform has two dependencies 
 1. implicit --> it is not-directly mentioned 
 2. explicit --> it is directly mentioned and specified using   (depends_on= [mention the dependency here])
