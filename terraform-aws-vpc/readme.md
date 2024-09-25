### AWS vpc module

This module creates following resources. using HA(high Availablility). we are getting first 2 AZ automatically.
* VPC
* Internet Gateway with vpc Association
* 2 public_subnets in 1a and 1b
* 2 private_subnets in 1a and 1b
* 2 database_subnets in 1a and 1b
* Elastic IP
* Nat_Gateway in public subnet
* public remote table 
* private remote table
* database remote table
* subnet and routetable associations
* vpc peering if user requests
* adding the peering route in default vpc, if user dosen't provide the ID explicitly
* Adding the peering routes in public,private and database.

### Inputs
* project_name (required) - your project name
* environment  (required) - your environment name
* 
* 