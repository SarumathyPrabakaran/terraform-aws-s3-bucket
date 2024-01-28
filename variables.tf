variable "region_name" {
  description = "The region in which the S3 bucket will be created."
  default = "us-east-1"
}

variable "module_version" {
  description = "Version of the Terraform module"
  default     = "1.0.0"
}

variable "bucket_name" {
  default = "aws-saru-210304"
  description = "The name of the s3 bucket to create"
}

variable "bucket_acl" {
  description = "ACL for the bucket - private, public-read, public-read-write, aws-exec-read, authenticated-read, and log-delivery-write"
  default = "public-read"
}

variable "versioning_enabled" {
    description = "Versioning for the bucket- Enabled/Disabled state"
    default = "Enabled"
  
}

variable "public_access" {
  description = "Public access for the bucket- true/false state"
  type = bool
  default = false
}

