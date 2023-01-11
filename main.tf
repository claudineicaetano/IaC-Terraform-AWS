terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-xx3r3rewrrwe-ubuntu" // Change this AMI according to the instance in the correct region, virginia in this case.
  instance_type = "t2.micro"

  key_name = "awsKeypairForinstances" // I must generate a key in aws and use it here.
  // Running line commands in bash type terminal to create a files and so on.
  user_data = <<-EOF
                #!/bin/bash
                cd /home/ubuntu
                echo "Made with Terraform" > fileWasCreated.txt
                EOF
  
 
  tags = {
    Name = "Instance to test  IaC"
  }
}
