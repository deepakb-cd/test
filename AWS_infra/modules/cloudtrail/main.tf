resource "aws_cloudtrail" "this" {
  name           = var.name
  s3_bucket_name = var.bucket_name

  ########################################
  # OPTIONAL PREFIX (for data lake struct)
  ########################################
  s3_key_prefix = var.s3_key_prefix != "" ? var.s3_key_prefix : null

  ########################################
  # KMS ENCRYPTION
  ########################################
  kms_key_id = var.kms_key_arn != "" ? var.kms_key_arn : null

  ########################################
  # BEST PRACTICES
  ########################################
  enable_logging                = true
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_log_file_validation    = true

  tags = var.tags
}