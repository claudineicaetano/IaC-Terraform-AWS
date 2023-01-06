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
  region  = "us-west-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3" // Alterar essa AMI de acordo com a instancia na região correta, virginia neste caso.
  instance_type = "t2.micro"

  key_name = "NomeDoArquivoKeyAws" // Devo gerar uma chave na aws e usar aqui.
 
  tags = {
    Name = "Instance to test  IaC"
  }
}
