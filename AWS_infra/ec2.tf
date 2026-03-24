provider "aws" {
region = var.region
}

# Get Default VPC

data "aws_vpc" "default" {
default = true
}

# Get Default Subnet

data "aws_subnet_ids" "default" {
vpc_id = data.aws_vpc.default.id
}

# Security Group for Splunk

resource "aws_security_group" "splunk_sg" {
name        = "splunk-sg"
description = "Allow Splunk ports"
vpc_id      = data.aws_vpc.default.id

ingress {
description = "SSH"
from_port   = 22
to_port     = 22
protocol    = "tcp"
cidr_blocks = [var.my_ip]
}

ingress {
description = "Splunk UI"
from_port   = 8000
to_port     = 8000
protocol    = "tcp"
cidr_blocks = [var.my_ip]
}

ingress {
description = "HEC API"
from_port   = 8088
to_port     = 8088
protocol    = "tcp"
cidr_blocks = [var.my_ip]
}

ingress {
description = "Forwarder"
from_port   = 9997
to_port     = 9997
protocol    = "tcp"
cidr_blocks = [var.my_ip]
}

egress {
from_port   = 0
to_port     = 0
protocol    = "-1"
cidr_blocks = ["0.0.0.0/0"]
}
}

# EC2 Instance

resource "aws_instance" "splunk_ec2" {
ami                    = var.ami_id
instance_type          = var.instance_type
subnet_id              = data.aws_subnet_ids.default.ids[0]
vpc_security_group_ids = [aws_security_group.splunk_sg.id]
key_name               = var.key_name

tags = {
Name = "Splunk-Server"
}
}

output "public_ip" {
value = aws_instance.splunk_ec2.public_ip
}
