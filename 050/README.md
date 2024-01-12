## Tests 

> By default, tests within Terraform create real infrastructure and can run assertions and validations against that infrastructure. This is analogous to integration testing because you are testing Terraform's core functionality by executing operations and validating the infrastructure Terraform creates.

> You can override the normal testing behavior by updating the command attribute within a run block (examples below). By default, each run block executes with command = apply instructing Terraform to execute a complete apply operation against your configuration. Replacing the command value with command = plan instructs Terraform to not create new infrastructure for this run block. This allows test authors to validate logical operations and custom conditions within their infrastructure in a process analogous to unit testing.



> Each Terraform test lives in a test file. Terraform discovers test files are based on their file extension: .tftest.hcl or .tftest.json.



### Read also
- [Unit test](https://developer.hashicorp.com/terraform/language/tests)


### Execute test

```bash
terraform test
```


```yaml
check "health_check" {
 	   data "http" "terraform_io" {
  	    url = "https://www.terraform.io"
 	   }
  	  assert {
   	    condition = data.http.terraform_io.status_code == 200
   	    error_message = "${data.http.terraform_io.url} returned an unhealthy status code"
  	  }
}
```

## Logging

as already mentioned

```bash
TF_LOG_PROVIDER=[INFO|DEBUG|TRACE|...]
TF_LOG_PATH=$(pwd)/somelog.log
```


