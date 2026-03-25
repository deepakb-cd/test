# ############################################
# # CLOUDTRAIL SETUP
# #############################################

# module "cloudtrail" {
#   source   = "./modules/cloudtrail"
#   for_each = var.cloudtrails

#   name        = each.value.name
#   bucket_name = module.s3_buckets[each.value.bucket_ref].bucket_id
#   tags        = each.value.tags
# }