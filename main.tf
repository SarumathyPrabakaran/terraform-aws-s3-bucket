resource "aws_s3_bucket" "s3_module" {
  bucket = var.bucket_name
  tags = {
    environment = "Production"
    group       = "tf"
  }
}


resource "aws_s3_bucket_cors_configuration" "s3_module" {
  bucket = aws_s3_bucket.s3_module.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "HEAD"]
    allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }
}


resource "aws_s3_bucket_ownership_controls" "s3_module" {
  bucket = aws_s3_bucket.s3_module.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
  depends_on = [aws_s3_bucket_public_access_block.s3_module]

}


resource "aws_s3_bucket_acl" "s3_module" {
  depends_on = [aws_s3_bucket_ownership_controls.s3_module]

  bucket = aws_s3_bucket.s3_module.id
  acl    = var.bucket_acl
}



resource "aws_s3_bucket_public_access_block" "s3_module" {
  count  = var.public_access ? 1 : 0
  bucket = aws_s3_bucket.s3_module.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket_versioning" "s3_module" {
  bucket = aws_s3_bucket.s3_module.id
  versioning_configuration {
    status = var.versioning_enabled
  }
}

resource "aws_s3_bucket_policy" "s3_module" {
  count = var.public_access ? 1 : 0

  bucket = aws_s3_bucket.s3_module.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Principal = "*"
        Action = [
          "s3:*",
        ]
        Effect = "Allow"
        Resource = [
          "arn:aws:s3:::${var.bucket_name}",
          "arn:aws:s3:::${var.bucket_name}/*"
        ]
      },
      {
        Sid       = "PublicReadGetObject"
        Principal = "*"
        Action = [
          "s3:GetObject",
        ]
        Effect = "Allow"
        Resource = [
          "arn:aws:s3:::${var.bucket_name}",
          "arn:aws:s3:::${var.bucket_name}/*"
        ]
      },
    ]
  })

  depends_on = [aws_s3_bucket_public_access_block.s3_module]
}
