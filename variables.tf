variable "region_name" {
  description = "The region in which the S3 bucket will be created."
  type        = string
  default     = "us-east-1"
}

variable "module_version" {
  description = "Version of the Terraform module"
  default     = "1.1.0"
}

variable "bucket_name" {
  description = "The name of the s3 bucket to create"
  type        = string
}

variable "bucket_acl" {
  description = "ACL for the bucket - private, public-read, public-read-write, aws-exec-read, authenticated-read, and log-delivery-write"
  type        = string
  default     = "public-read"
}

variable "versioning_enabled" {
  description = "Versioning for the bucket- Enabled/Disabled state"
  type        = string

  default = "Enabled"

}

variable "public_access" {
  description = "Public access for the bucket- true/false state"
  type        = bool
  default     = false
}

