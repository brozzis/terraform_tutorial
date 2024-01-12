# valid_string_concat.tftest.hcl

variables {
  bucket_prefix = "test"
}

run "valid_string_concat" {

  command = plan

  assert {
    condition     = aws_s3_bucket.bucket.bucket == "test-bucket"
    error_message = "S3 bucket name did not match expected"
  }

}


run "overrides_root_level_value" {

  command = plan

  variables {
    bucket_prefix = "other"
  }

  assert {
    condition     = aws_s3_bucket.bucket.bucket == "other-bucket"
    error_message = "S3 bucket name did not match expected"
  }

}


run "file_should_be_json01" {
  command = plan

  assert {
    condition     = try(jsondecode(local_file.config.content), null) != null
    error_message = "The file is not valid JSON"
  }
}


run "file_should_be_json02" {
  command = plan

  assert {
    condition     = try(jsondecode(local_file.config_ip.content), null) != null
    error_message = "The file is not valid JSON"
  }
}

