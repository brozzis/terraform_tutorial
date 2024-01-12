# main.tf
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
  type = string
  default = "eu-south-1"
  
}

provider "aws" {
  region  = var.regione
  profile = "sbrozzi@sinthera"
}


module "ec2" {
   source = "./aws"
}

resource "local_file" "config" {
  content  = "{\n  \"region\": \"${var.regione}\"}"
  filename = "config.json"
}

resource "local_file" "config_ip" {
  content  = "{\n  \"remote_ip\": \"${module.ec2.instance_ip}\"}"
  filename = "config.json"
}



variable "bucket_prefix" {
  type = string
}

resource "aws_s3_bucket" "bucket" {
  bucket = "${var.bucket_prefix}-bucket-g1bberish678"
}

output "bucket_name" {
  value = aws_s3_bucket.bucket.bucket
}
