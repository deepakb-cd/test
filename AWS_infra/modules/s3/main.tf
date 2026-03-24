# resource "aws_s3_bucket" "this" {
#   bucket = var.bucket_name
#   tags   = var.tags
# }

# resource "aws_s3_bucket_versioning" "this" {
#   bucket = aws_s3_bucket.this.id

#   versioning_configuration {
#     status = var.versioning
#   }
# }

# resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
#   bucket = aws_s3_bucket.this.id

#   rule {
#     apply_server_side_encryption_by_default {
#       sse_algorithm = var.encryption
#     }
#   }
# }

# resource "aws_s3_bucket_public_access_block" "this" {
#   bucket = aws_s3_bucket.this.id

#   block_public_acls       = var.block_public
#   block_public_policy     = var.block_public
#   ignore_public_acls      = var.block_public
#   restrict_public_buckets = var.block_public
# }

# ############################################
# # S3 OBJECT CREATION (Folders / Files)
# ############################################

# resource "aws_s3_object" "objects" {
#   for_each = toset(var.object_keys)

#   bucket = aws_s3_bucket.this.id
#   key    = each.value
# }