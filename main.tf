#main.tf
#VPC
resource "aws_vpc" "vpc_new" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "${var.vpc_tenancy}"

  tags {
    Name  = "vpc_new"
    Batch = "NEW"
  }
}

# Define the public subnet
resource "aws_subnet" "public-subnet" {
  vpc_id = "${aws_vpc.vpc_new.id}"
  cidr_block = "${var.public_subnet_cidr}"
  availability_zone = "us-east-1a"

  tags {
    Name = "Web Public Subnet"
  }
}

# Define the security group for public subnet
resource "aws_security_group" "sgweb" {
  name = "vpc_test_web"
  description = "Allow incoming HTTP connections & SSH access"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   vpc_id="${aws_vpc.vpc_new.id}"

  tags {
    Name = "Web Server SG"
  }
}

# Define SSH key pair for our instances
#resource "aws_key_pair" "default" {
#  key_name = "vpctestkeypair"
#  public_key = "${file("${var.key_path}")}"
#}

# Define webserver inside the public subnet
resource "aws_instance" "wb" {
   ami  = "${var.ami}"
   instance_type = "${var.instype}"
   #key_name = "${aws_key_pair.default.id}"
   subnet_id = "${aws_subnet.public-subnet.id}"
   vpc_security_group_ids = ["${aws_security_group.sgweb.id}"]
   associate_public_ip_address = true
   source_dest_check = false
   #user_data = "${file("install.sh")}"

  tags {
    Name = "webserver"
  }
}





