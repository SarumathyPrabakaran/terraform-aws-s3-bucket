# Terraform-AWS-S3-Bucket


This Terraform module deploys an S3 bucket on AWS.

## Version

The current version of the module is v1.2.0.

## Usage
```hcl
module "my_s3_bucket" {
  source = "git::https://github.com/SarumathyPrabakaran/terraform-aws-s3-bucket.git?ref=v1.2.0"
  bucket_name         = "any-unique-bucket-name"
  bucket_acl          = "private"  # Optional, default is "private"
  versioning_enabled  = true       # Optional, default is false
}
```
## Inputs
1. bucket_name (Required): The name of the S3 bucket.
2. bucket_acl (Optional, Default: "private"): The access control list (ACL) for the bucket.
3. versioning_enabled (Optional, Default: Enabled): Whether versioning should be enabled for the bucket.


## Outputs
1. s3_bucket_name: The name of the created S3 bucket.
2. s3_bucket_arn: The ARN of the created S3 bucket.


## Applying the Configuration
Ensure you have Terraform installed on your machine.

1. Create a Terraform script (e.g., main.tf) with the module configuration.

```
module "my_s3_bucket" {
  source = "git::https://github.com/SarumathyPrabakaran/terraform-aws-s3-bucket.git?ref=v1.2.0"

  bucket_name         = "any-unique-bucket-name"
  bucket_acl          = "private"
  versioning_enabled  = true
}
```
2. Initialize your Terraform configuration.

        terraform init


3. Apply the Terraform configuration. Enter yes when prompted.

        terraform apply


4. To verify the S3 bucket creation, you can use the AWS CLI. Run the following command to list all S3 buckets:
   
        aws s3 ls

Ensure that the bucket you specified in the configuration is present in the list.

Additional Details
For more details on the module, refer to the Terraform documentation ```https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket```.




