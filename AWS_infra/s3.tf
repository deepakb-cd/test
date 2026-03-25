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

  kms_key_arn = module.kms[each.value.kms_ref].arn
  s3_key_prefix = each.value.s3_key_prefix
}