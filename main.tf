resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name
  tags = {
    environment = "Production"
    group = "tf"
  }
}

resource "aws_s3_bucket_ownership_controls" "s3_bucket_own" {
  bucket = aws_s3_bucket.s3_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.s3_bucket_own]

  bucket = aws_s3_bucket.s3_bucket.id
  acl    = var.bucket_acl
}


resource "aws_s3_bucket_versioning" "s3_bucket_versioning" {
  bucket = aws_s3_bucket.s3_bucket.id
  versioning_configuration {
    status = var.bucket_versioning
  }
}
