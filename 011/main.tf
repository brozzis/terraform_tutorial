
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

output "for_directive_index_if_else_strip" {
    value=trimspace(<<EOT
    %{~ for i, name in var.user_names ~}
        ${name}
        %{ if i < length(var.user_names) - 1 }
            , 
        %{ else }
            . 
        %{ endif }
    %{~ endfor ~}
EOT
)
}


variable "environment" {
  type = string
  default = "DEV"
}


locals{
  dev    = var.environment == "DEV" ? "uksouth" : ""
  uit 	 = var.environment == "UIT" ? "ukwest" : ""
  prod 	 = var.environment != "PROD" && var.environment != "UIT" ? "useast2" : ""
  region = coalesce(local.dev, local.uit, local.prod)
}

output "region" {
  value = local.region
}



output "for_directive_index_if_else_strip2" {
    value=<<EOT
    %{~ for i, name in var.user_names ~} ${~  name ~} %{ if i < length(var.user_names) - 1 },%{ else }.%{ endif } %{~ endfor ~}
EOT
}

