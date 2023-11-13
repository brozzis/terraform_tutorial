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

resource "aws_instance" "example_server" {
  ami           = var.immagine
  instance_type = var.tipo_istanza

  tags = {
    Name = "Terraform Example",
    segreto = var.secret
  }
}

