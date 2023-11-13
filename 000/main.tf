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
  region  = "eu-south-1"
  profile = "sbrozzi@sinthera"
}

resource "aws_instance" "example_server" {
  ami           = "ami-025765768cef3dca5"
  instance_type = "t3.micro"

  tags = {
    Name = "Terraform Example"
  }
}

