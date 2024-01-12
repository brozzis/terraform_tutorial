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


variable "environment" {
  default = "prod"
}

resource "aws_iam_user" "the-accounts" {
  for_each = var.environment == "prod" ? toset( ["Todd", "James", "Alice", "Dottie"] ) : toset([])
      name     = each.key
}

