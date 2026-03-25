# data "aws_caller_identity" "current" {}

# locals {
#   base_policy = [
#     {
#       Sid = "EnableRootPermissions"
#       Effect = "Allow"
#       Principal = {
#         AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
#       }
#       Action   = "kms:*"
#       Resource = "*"
#     }
#   ]

#   cloudtrail_policy = var.enable_cloudtrail ? [
#   {
#     Sid = "AllowCloudTrailUse"
#     Effect = "Allow"
#     Principal = {
#       Service = "cloudtrail.amazonaws.com"
#     }
#     Action = [
#       "kms:GenerateDataKey*",
#       "kms:Encrypt",
#       "kms:Decrypt",
#       "kms:ReEncrypt*",
#       "kms:DescribeKey"
#     ]
#     Resource = "*"
#   }
# ] : []
# }

# resource "aws_kms_key" "this" {
#   description         = var.description
#   enable_key_rotation = true

#   policy = jsonencode({
#     Version   = "2012-10-17"
#     Statement = concat(local.base_policy, local.cloudtrail_policy)
#   })

#   tags = var.tags
# }

# resource "aws_kms_alias" "this" {
#   name          = var.alias
#   target_key_id = aws_kms_key.this.id
# }

# output "arn" {
#   value = aws_kms_key.this.arn
# }