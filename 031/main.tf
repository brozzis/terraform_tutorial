

provider "aws" {
  region  = var.regione
  profile = "sbrozzi@sinthera"
}


resource "aws_instance" "example" {
    ami   = data.aws_ami.my_ami.id
    instance_type = var.tipo_istanza

    vpc_security_group_ids = [aws_security_group.instance.id]

    user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup httpd -f -p 8080 &
              EOF

    user_data_replace_on_change = true

    tags = {
        Name = "terraform-example"
    }
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


output "id" {
  value = aws_instance.example.id
  
}