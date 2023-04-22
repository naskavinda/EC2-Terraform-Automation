provider "aws" {
  access_key = "Your access key here"
  secret_key = "Your secret key here"
  region     = "us-east-1"
}

resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "example-vpc"
  }
}

resource "aws_security_group" "example" {
  name_prefix = "example-sg-"
  vpc_id      = aws_vpc.example.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_subnet" "example" {
  vpc_id     = aws_vpc.example.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "example-subnet"
  }
}

resource "aws_instance" "example" {
  ami                    = "ami-06e46074ae430fba6"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.example.id]
  subnet_id              = aws_subnet.example.id
  tags = {
    Name        = "Dev-056"
    Environment = "Dev"
    Owner       = "Supun Kavinda"
  }
}