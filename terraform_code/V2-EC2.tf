# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "demo-server" {
  ami = "ami-02d26659fd82cf299"
  instance_type = "t3.micro"
  key_name = "dpp"
  
  vpc_security_group_ids = [aws_security_group.demo-sg.id]

  tags = {
    Name = "demo-server"
}
}
resource "aws_security_group" "demo-sg" {
  name        = "demo-sg"
  description = "SSH Access"
  
  ingress {
    description      = "Shh access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "ssh-port"

  }
}