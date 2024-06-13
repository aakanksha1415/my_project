resource "aws_s3_bucket" "media" {
  bucket = "media-streaming-bucket"

  acl = "private"

  tags = {
    Name        = "MediaBucket"
    Environment = "Dev"
  }
}
