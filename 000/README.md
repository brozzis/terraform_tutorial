## First steps: basic example

Basic creation of an AWS EC2 instance.
Requires a correct AWScli configuration, change the profile accordingly (or remove it if not needed).

```bash
terraform init
terraform validate
terraform fmt -check
terraform plan
terraform apply
...
terraform destroy
```

```bash
TF_LOG=debug terraform apply
```

Example awscli configuration:
```ini
[profile stefano.brozzi]
region = us-east-1
profile = stefano.brozzi

[profile sbrozzi@sinthera]
region = eu-south-1
profile = sbrozzi@sinthera
```