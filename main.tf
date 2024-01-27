resource "aws_s3_bucket" "s3_module" {
  bucket = var.bucket_name
  tags = {
    environment = "Production"
    group = "tf"
  }
}

resource "aws_s3_bucket_ownership_controls" "s3_module" {
  bucket = aws_s3_bucket.s3_module.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "s3_module" {
  depends_on = [aws_s3_bucket_ownership_controls.s3_module]

  bucket = aws_s3_bucket.s3_module.id
  acl    = var.bucket_acl
}


resource "aws_s3_bucket_versioning" "s3_module" {
  bucket = aws_s3_bucket.s3_module.id
  versioning_configuration {
    status = var.versioning_enabled
  }
}
