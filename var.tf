# Variable for EC2
variable "ami" {
  default = "ami-6871a115"
}

variable "instype" {
  default = "t2.micro"
}

# Variable for VPC
variable "vpc_cidr" {
  default = "192.50.0.0/16"
}

variable "vpc_tenancy" {
  default = "default"
}


variable "public_subnet_cidr" {
  description = "CIDR for the public subnet"
  default = "192.50.1.0/24"
}

# Declare the data source
#data "aws_availability_zones" "azs" {}


#variable "key_path" {
#  description = "SSH Public Key path"
#  default = "C:/Users/KiranReddy/Desktop/vpctestkeypair.pem"
#}
