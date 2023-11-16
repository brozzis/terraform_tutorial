
variable "variabile" {
    type = string
    default = "valore"
  
}

variable "abc" {
    type = map(string)
    default = {
      "name" = "value"
    }
  
}

output "name" {
    value = var.variabile
}

output "tag" {
    value = var.abc.name
}
