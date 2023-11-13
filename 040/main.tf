
resource "null_resource" "local" {

    triggers = {
        workspace = terraform.workspace
    }
    provisioner "local-exec" {
        command = "terraform workspace list"
    }
}

output "workspace" {
    value = "${terraform.workspace}"
}

output "dove_siamo" {
    value = "prod" == terraform.workspace ? "Milano" : "Roma"
    depends_on = [ null_resource.local ]
}

resource "null_resource" "terza" {
    provisioner "local-exec" {
        command = "terraform workspace new newyork"
    }
    depends_on = [ null_resource.local ]
}

output "nuova_posizione" {
    value = "${terraform.workspace}"
    depends_on = [ null_resource.terza ]

}


resource "null_resource" "cleanup" {
    provisioner "local-exec" {
        command = "terraform workspace select default; terraform workspace delete -force newyork"
    }
    depends_on = [ null_resource.terza ]
}