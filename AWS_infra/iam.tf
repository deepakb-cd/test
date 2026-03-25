# module "iam_roles" {
#   source   = "./modules/iam"
#   for_each = var.iam_roles

#   role_name           = each.value.role_name
#   service             = each.value.service
#   managed_policy_arns = each.value.managed_policy_arns
#   tags                = each.value.tags
# }