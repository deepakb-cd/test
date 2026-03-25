data "aws_caller_identity" "current" {}

locals {
  cloudtrail_prefix   = var.s3_key_prefix != "" ? "${var.s3_key_prefix}/" : ""
  cloudtrail_resource = "arn:aws:s3:::${aws_s3_bucket.this.id}/${local.cloudtrail_prefix}AWSLogs/${data.aws_caller_identity.current.account_id}/*"
}
############################################
# S3 BUCKET
############################################

resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  tags   = var.tags
}

############################################
# VERSIONING
############################################

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = var.versioning
  }
}

############################################
# ENCRYPTION
############################################

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = var.encryption == "aws:kms" ? "aws:kms" : "AES256"
      kms_master_key_id = var.encryption == "aws:kms" ? var.kms_key_arn : null
    }
  }
}

############################################
# PUBLIC ACCESS BLOCK
############################################

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = var.block_public
  block_public_policy     = var.block_public
  ignore_public_acls      = var.block_public
  restrict_public_buckets = var.block_public
}

############################################
# CLOUDTRAIL POLICY (FIXED + DYNAMIC)
############################################

resource "aws_s3_bucket_policy" "cloudtrail" {
  count  = var.enable_cloudtrail_policy ? 1 : 0
  bucket = aws_s3_bucket.this.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AWSCloudTrailAclCheck"
        Effect = "Allow"
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }
        Action = [
          "s3:GetBucketAcl",
          "s3:GetBucketLocation"
        ]
        Resource = "arn:aws:s3:::${aws_s3_bucket.this.id}"
      },
      {
        Sid    = "AWSCloudTrailWrite"
        Effect = "Allow"
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }
        Action   = "s3:PutObject"

        Resource = local.cloudtrail_resource

        Condition = {
          StringEquals = {
            "s3:x-amz-acl" = "bucket-owner-full-control"
          }
        }
      }
    ]
  })
}
############################################
# OBJECTS
############################################

resource "aws_s3_object" "objects" {
  for_each = toset(var.object_keys)

  bucket = aws_s3_bucket.this.id
  key    = each.value
}

