# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "demo-server" {
  ami = "ami-02d26659fd82cf299"
  instance_type = "t3.micro"
  key_name = "dpp"
}