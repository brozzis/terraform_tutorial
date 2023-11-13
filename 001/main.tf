terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

variable "immagine" {
  description = "The AMI to use for the server"
  type = string
  default     = "ami-025765768cef3dca5"
}



variable "regione" {
  description = "The region to deploy to"
  type = string
  default     = "eu-south-1"
}

provider "aws" {
  region  = var.regione
  profile = "sbrozzi@sinthera"
}


variable "tipo_istanza" {
  description = "The type of instance to start"
  type = string
  default     = "t3.micro"
  
}


resource "aws_instance" "example_server" {
  ami           = var.immagine
  instance_type = var.tipo_istanza

  tags = {
    Name = "Terraform Example"
  }
}

