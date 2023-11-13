variable "immagine" {
  description = "The AMI to use for the server"
  type = string
  default     = "ami-025765768cef3dca5"
}

variable "tipo_istanza" {
  description = "The type of instance to start"
  type = string
  default     = "t3.micro"
  
}

variable "regione" {
  description = "The region to deploy to"
  type = string
  default     = "eu-south-1"
}

variable "secret" {
  description = "valore segretissimo"
  type = string
  default = "segreto"
  sensitive = true
}

variable "tags" {
    description = "la lista dei tag da assegnare alla risorsa"
    type = map(string)
    default = {
        "Name" = "istanza di test"
        "Environment" = "test"
    }
  
}
