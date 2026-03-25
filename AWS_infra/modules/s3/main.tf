# data "aws_caller_identity" "current" {}

# ############################################
# # S3 BUCKET
# ############################################

# resource "aws_s3_bucket" "this" {
#   bucket = var.bucket_name
#   tags   = var.tags
# }

# ############################################
# # VERSIONING
# ############################################

# resource "aws_s3_bucket_versioning" "this" {
#   bucket = aws_s3_bucket.this.id

#   versioning_configuration {
#     status = var.versioning
#   }
# }

# ############################################
# # ENCRYPTION
# ############################################

# resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
#   bucket = aws_s3_bucket.this.id

#   rule {
#     apply_server_side_encryption_by_default {
#       sse_algorithm = var.encryption
#     }
#   }
# }

# ############################################
# # PUBLIC ACCESS BLOCK
# ############################################

# resource "aws_s3_bucket_public_access_block" "this" {
#   bucket = aws_s3_bucket.this.id

#   block_public_acls       = var.block_public
#   block_public_policy     = var.block_public
#   ignore_public_acls      = var.block_public
#   restrict_public_buckets = var.block_public
# }

# ############################################
# # CLOUDTRAIL POLICY (OPTIONAL)
# ############################################

# resource "aws_s3_bucket_policy" "cloudtrail" {
#   bucket = aws_s3_bucket.this.id

#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Sid    = "AWSCloudTrailAclCheck"
#         Effect = "Allow"
#         Principal = {
#           Service = "cloudtrail.amazonaws.com"
#         }
#         Action = [
#           "s3:GetBucketAcl",
#           "s3:GetBucketLocation"   # 🔥 THIS WAS MISSING
#         ]
#         Resource = "arn:aws:s3:::${aws_s3_bucket.this.id}"
#       },
#       {
#         Sid    = "AWSCloudTrailWrite"
#         Effect = "Allow"
#         Principal = {
#           Service = "cloudtrail.amazonaws.com"
#         }
#         Action   = "s3:PutObject"

#         # 🔥 MUST MATCH PREFIX
#         Resource = "arn:aws:s3:::${aws_s3_bucket.this.id}/cloudtrail/AWSLogs/${data.aws_caller_identity.current.account_id}/*"

#         Condition = {
#           StringEquals = {
#             "s3:x-amz-acl" = "bucket-owner-full-control"
#           }
#         }
#       }
#     ]
#   })
# }############################################
# # OBJECTS (FOLDERS)
# ############################################

# resource "aws_s3_object" "objects" {
#   for_each = toset(var.object_keys)

#   bucket = aws_s3_bucket.this.id
#   key    = each.value
# }
