# ############################################
# # KMS KEYS
# ############################################

# module "kms" {
#   source   = "./modules/kms"
#   for_each = var.kms_keys

#   description = each.value.description
#   alias       = each.value.alias
#   key_policy  = each.value.key_policy
#   tags        = each.value.tags
# }