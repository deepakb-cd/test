# ############################################
# # KMS KEYS
# ############################################

module "kms" {
  source   = "./modules/kms"
  for_each = var.kms_keys

  description       = each.value.description
  alias             = each.value.alias
  tags              = each.value.tags
  enable_cloudtrail = each.value.enable_cloudtrail

  region = var.region
}