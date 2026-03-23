############################################
# CLOUDTRAIL SETUP
############################################

module "cloudtrail" {
  source   = "./modules/cloudtrail"
  for_each = var.cloudtrails

  name        = each.value.name
  bucket_name = module.s3[each.value.bucket_ref].bucket_id
  tags        = each.value.tags
}