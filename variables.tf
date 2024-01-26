variable "region_name" {
  description = "The region in which the S3 bucket will be created."
  default = "us-east-1"
}

variable "bucket_name" {
    default = "sarumathy-27012024-bucket"
  description = "The name of the s3 bucket to create"
}

variable "bucket_acl" {
  description = "ACL for the bucket - private, public-read, public-read-write, aws-exec-read, authenticated-read, and log-delivery-write"
  default = "private"
}

variable "bucket_versioning" {
    description = "Versioning for the bucket- Enabled/Disabled state"
    default = "Enabled"
  
}