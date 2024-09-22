###### Functions List ######
1. length function
2. startswith(string,prefix)



############################### Terraform Functions #########################
                            
###### Length Function ######
 length([])
0
length(["a","b"])
2
length({"a"= "b"}) # expressions are always counted as one
1
length("hello")
5

###### startswith Function ######
startswith(string , prefix)