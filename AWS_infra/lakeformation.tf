############################################
#  REGISTER RESOURCES IN LAKE FORMATION
############################################

module "lakeformation" {
  source   = "./modules/lakeformation"
  for_each = var.lakeformation_resources

  resource_arn = module.s3_buckets[each.value.bucket_ref].bucket_arn
}

############################################
#  ASSIGN PERMISSIONS
############################################

# module "lake_permissions" {
#   source   = "./modules/lakeformation_permissions"
#   for_each = var.lake_permissions

#   principal    = each.value.principal
#   permissions  = each.value.permissions
#   resource_arn = module.s3[each.value.bucket_ref].bucket_arn
#   depends_on   = [module.lakeformation]
# }