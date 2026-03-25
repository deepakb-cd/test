# module "s3_buckets" {
#   source = "./modules/s3"

#   for_each = var.s3_buckets

#   bucket_name = each.value.bucket_name
#   tags        = each.value.tags
#   object_keys = each.value.object_keys
# }