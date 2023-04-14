provider "aws" {
  access_key = "Your access key here"
  secret_key = "Your secret key here"
  region     = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}