
variable "user_names" {	  
    description = "Create IAM users with these names"	  
    type = list(string)	  
    default = ["Paolo", "Stefano", "Nicola"]	
}


variable "project_team" {  
    type = map(string)  
    default = {  
        Paolo = "Project Manager"  
        Stefano = "System Architect"
    }
}


output "name" {
  value = abs(-42)
}

output "team_roles" {  
    value = [for name, role in var.project_team: "${name} is the ${role}"]
}

output "team_roles2" {  
    value = {for name, role in var.project_team: name => upper(role)}
}



output "for_string_directive" {
    value = "%{ for name in var.user_names }${name}, %{ endfor }"
    
}

variable "saluto" {
    type = string
    default = "ciao"
}


output ternary_syntax {
    value = var.saluto == "ciao" ? "ciao anche a te" : "buongiorno"
}

