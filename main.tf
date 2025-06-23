provider "aws" {
  region = "eu-west-2"
}

resource "aws_security_group" "test_sg" {
  name_prefix = "test-sg-"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "test_instance" {
  ami             = "ami-044415bb13eee2391"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.test_sg.name]
  tags = {
    Name = "TestInstance"
  }
}