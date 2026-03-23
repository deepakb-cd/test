module "iam_roles" {
  source   = "./modules/iam"
  for_each = var.iam_roles

  role_name           = each.value.role_name
  assume_role_policy  = each.value.assume_role_policy
  managed_policy_arns = each.value.managed_policy_arns
  inline_policy_json  = lookup(each.value, "inline_policy_json", null)
  tags                = each.value.tags
}