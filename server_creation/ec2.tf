provider "aws" {
  region = "us-east-1"
  
}

resource "aws_instance" "docker {
  ami           = "ami-0c55b159cbfafe1f0" # Example AMI ID, replace with a valid one
  instance_type = "t2.micro"
  
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