terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

variable "regione" {
  default = "eu-south-1"
  
}


provider "aws" {
  region  = var.regione
  profile = "sbrozzi@sinthera"
}

variable "my_list" {
  default = ["Todd", "James", "Alice", "Dottie", "Alice"]
}


resource "aws_instance" "server" {
  count = 4 # create four similar EC2 instances

  ami           = "ami-a1b2c3d4"
  instance_type = "t2.micro"

  tags = {
    Name = "Server ${count.index}"
  }
}


resource "aws_iam_user" "the-accounts" {
  for_each = toset( ["Todd", "James", "Alice", "Dottie"] )
  name     = each.key
}

output "test_for_upper" {
    value = [for k, v in aws_iam_user.the-accounts : upper(k)]
}