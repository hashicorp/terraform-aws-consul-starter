# creates an S3 bucket for consul data with a random UUID and suffix
resource "aws_s3_bucket" "consul_data" {
  count  = var.enable_snapshots ? 1 : 0
  bucket = "${random_id.environment_name.hex}-consul-data"
  acl    = "private"
}

# sets s3 snapshot bucket to deny public access (see: https://www.terraform.io/docs/providers/aws/r/s3_bucket_public_access_block.html)
resource "aws_s3_bucket_public_access_block" "consul_data" {
  count                   = var.enable_snapshots ? 1 : 0
  bucket                  = aws_s3_bucket.consul_data[0].id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
