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

resource "aws_instance" "example" {
  ami                    = "ami-06e46074ae430fba6"
  instance_type          = "t2.micro"
  tags = {
    Name        = "Dev-056"
    Environment = "Dev"
    Owner       = "Supun Kavinda"
  }
}