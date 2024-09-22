

resource "aws_s3_bucket" "syntax01" {
  bucket = "for-syntax"
  # force_destroy = true   -> enabling this will delete the bucket forcefully, even if it has data.
  # force_destroy = false <default> -> enabling this will not-delete the bucket even forcefully

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}