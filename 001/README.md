## Variables

Some variables added to the basic example.

```
variable "name_of_the_variable" {
  description = "description of the variable"
  type = string # numeric|string|list()|map()|object()
  
  default     = "default value"
  
}
```

Readability and mantainability *not* at their best...