########################################## Taint ######################################




############################## Random integer ##########################################
# we use random-integer resource to avoid the duplicacy of resources

# resource "random_integer" "priority" {
#   min = 1
#   max = 50000
#   keepers = {
#     # Generate a new integer each time we switch to a new listener ARN
#     listener_arn = #var.listener_arn
#   }
# }
#############################  Output of random-integer
#   < random_integer.priority.result > add this to the resource you want to create again 
#    the number generated here will come along with the new resource name
#




