locals {
  env = "sample"
}

resource "aws_vpc" "sample-vpc" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    tags = {
      Name = "${local.env}-vpc"
    }
}

resource "aws_subnet" "sample-subnet" {
  vpc_id = aws_vpc.sample-vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "${local.env}-subnet"
  }
}

resource "aws_security_group" "sample-sg" {
  name = "allow_ssh"
  description = "Allow SSH traffic"
  vpc_id = aws_vpc.sample-vpc.id

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${local.env}-sg"
  }
}

resource "aws_internet_gateway" "sample-igw" {
  vpc_id = aws_vpc.sample-vpc.id
}


resource "aws_route_table" "sample-rtable" {
  vpc_id = aws_vpc.sample-vpc.id

  tags = {
    Name = "${local.env}-rt"
  }
}

resource "aws_route" "sample-rt" {
  route_table_id = aws_route_table.sample-rtable.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.sample-igw.id
}

resource "aws_route_table_association" "name" {
  subnet_id = aws_subnet.sample-subnet.id
  route_table_id = aws_route_table.sample-rtable.id
}
