# module "cloudtrail" {
#   source   = "./modules/cloudtrail"
#   for_each = var.cloudtrails

#   name          = each.value.name
#   bucket_name   = module.s3_buckets[each.value.bucket_ref].bucket_id
#   kms_key_arn   = try(module.kms[each.value.kms_ref].arn, "")
#   s3_key_prefix = each.value.s3_key_prefix
#   tags          = each.value.tags

#   ########################################
#   # IMPORTANT: ensure S3 + KMS ready
#   ########################################
#   depends_on = [
#     module.s3_buckets,
#     module.kms
#   ]
# }