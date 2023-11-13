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
  region  = var.regione
  profile = "sbrozzi@sinthera"
}

data "aws_ami" "my_ami" {
    most_recent = true
    owners          = ["amazon"]
    filter {
      name = "name"
      values = ["amzn2-ami-hvm*"]
    }
}



resource "aws_instance" "example_server" {
  ami   = data.aws_ami.my_ami.id
  ## ami           = var.immagine
  instance_type = var.tipo_istanza

  tags = {
    Name = "Terraform Example",
    segreto = var.secret
  }
}


output "ip" {
  value = aws_instance.example_server.public_ip
}

output "subnets" {
  value = aws_instance.example_server.subnet_id
}

