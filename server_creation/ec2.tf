provider "aws" {
  region = "us-east-1"
  
}

resource aws_security_group "docker_sg" {
  name        = "docker_security_group"
  description = "Security group for Docker instance"
  
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "docker" {
  ami           = "ami-09c813fb71547fc4f" 
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.docker_sg.id]

  
  
#we need large disk size to install docker so we are using below
root_block_device {
   delete_on_termination = true
    volume_size = 50
    volume_type = "gp2"
  }

  tags = {
    Name = "DockerInstance"
  }
  
}   