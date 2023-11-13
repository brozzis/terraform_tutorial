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

variable "subnet_id" {}

data "aws_subnet" "selected" {
  id = var.subnet_id
}


output "name" {
  value = data.aws_subnet.selected.id
  
}

resource "aws_security_group" "subnet" {
  vpc_id = data.aws_subnet.selected.vpc_id

  ingress {
    cidr_blocks = [data.aws_subnet.selected.cidr_block]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
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

