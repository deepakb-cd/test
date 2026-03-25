
############################################
# S3 BUCKETS
############################################

module "s3_buckets" {
  source   = "./modules/s3"
  for_each = var.s3_buckets

  bucket_name              = each.value.bucket_name
  tags                     = each.value.tags
  versioning               = each.value.versioning
  encryption               = each.value.encryption
  block_public             = each.value.block_public
  object_keys              = each.value.object_keys
  enable_cloudtrail_policy = each.value.enable_cloudtrail_policy
}