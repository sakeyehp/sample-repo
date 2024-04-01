resource "aws_s3_bucket" "sample-bucket" {
  bucket = var.bucket_name

  tags = {
    Name = "sample-bucket"
  }
}

resource "aws_s3_bucket_versioning" "sample-bucket-versioning" {
  bucket = aws_s3_bucket.sample-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}