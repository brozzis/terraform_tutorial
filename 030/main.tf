
module "ec2" {
   source = "./aws"
   # [CONFIG ...]
   tags = var.my_tags
}

output "ip" {
  value = module.ec2.instance_ip
}