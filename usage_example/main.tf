provider "aws" {
  region = "us-east-1"
  profile = "new1"
}

module "my_s3_bucket" {
  source = "git::https://github.com/SarumathyPrabakaran/terraform-aws-s3-bucket.git?ref=v1.0.0"

  bucket_name         = "sarumathy-27012024-s3-bucket-3"
  bucket_acl          = "public-read"
  bucket_versioning  = "Enabled"
}

