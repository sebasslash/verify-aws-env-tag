resource_policy "aws_s3_bucket" "require_environment_tag" {
  enforce {
    condition     = core::can(attrs.tags) ? core::contains(core::keys(attrs.tags), "Environment") : false
    error_message = "S3 bucket must have an 'Environment' tag."
  }
}

resource_policy "aws_s3_bucket" "require_versioning_tag" {
  enforce {
    condition     = core::try(core::contains(core::keys(attrs.tags), "Versioning"), false)
    error_message = "S3 bucket must have a 'Versioning' tag."
  }
}
