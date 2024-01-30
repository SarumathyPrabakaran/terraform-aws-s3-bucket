variable "region_name" {
  description = "The region in which the S3 bucket will be created."
  type        = string
  default     = "us-east-1"
}

variable "module_version" {
  description = "Version of the Terraform module"
  default     = "1.2.0"
}

variable "bucket_name" {
  description = "The name of the s3 bucket to create"
  type        = string
}

variable "bucket_acl" {
  description = "ACL for the bucket - private, public-read, public-read-write, aws-exec-read, authenticated-read, and log-delivery-write"
  type        = string
  default     = "private"
}

locals {
  is_public_acl = contains(["public-read", "public-read-write"], var.bucket_acl)
}


variable "versioning_enabled" {
  description = "Versioning for the bucket- Enabled/Disabled state"
  type        = string

  default = "Enabled"

}



