output "s3_bucket_name" {
  value       = aws_s3_bucket.s3_module.bucket
  description = "The name of the created S3 bucket."
}

output "s3_bucket_arn" {
  value       = aws_s3_bucket.s3_module.arn
  description = "The ARN of the created S3 bucket."
}