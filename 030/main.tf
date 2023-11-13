
module "ec2" {
   source = "./aws"
   # [CONFIG ...]
   tags = var.tags
}