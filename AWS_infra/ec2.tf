# # provider "aws" {
# # region = var.region
# # }

# # Get Default VPC

# data "aws_vpc" "default" {
#   default = true
# }

# # EC2 Instance

# resource "aws_instance" "splunk_ec2" {
#   ami                    = var.ami_id
#   instance_type          = var.instance_type
#   subnet_id              = var.subnet_id
#   vpc_security_group_ids = [var.security_group_id]
#   key_name               = var.key_name

#   tags = {
#     Name = "Splunk-Server"
#   }
# }

# output "public_ip" {
#   value = aws_instance.splunk_ec2.public_ip
# }
