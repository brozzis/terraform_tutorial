# valid_string_concat.tftest.hcl

variables {
  bucket_prefix = "te567st"
}

run "valid_string_concat" {

  command = plan
  // command = apply

  assert {
    condition     = aws_s3_bucket.bucket.bucket == "te567st-bucket"
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




run "file_contents_should_be_valid_json" {
  command = plan

  assert {
    condition     = try(jsondecode(local_file.config.content), null) != null
    error_message = "The file is not valid JSON"
  }
}
