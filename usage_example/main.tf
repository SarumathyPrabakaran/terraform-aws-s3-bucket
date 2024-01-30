provider "aws" {
  region = "us-east-1"
}


module "my_s3_bucket" {
  source = "git::https://github.com/SarumathyPrabakaran/terraform-aws-s3-bucket.git?ref=v1.1.0"
  bucket_name         = "sarumathy-210304-bucket"
  bucket_acl          = "private"  
  versioning_enabled  = true      
  public_access = true             
}