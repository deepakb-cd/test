############################################
# AWS CONFIG SETUP (Recorder + Channel)
############################################

module "aws_config" {
  source   = "./modules/aws_config"
  for_each = var.config_setups

  recorder_name = each.value.recorder_name
  channel_name  = each.value.channel_name
  bucket_name   = module.s3[each.value.bucket_ref].bucket_id
  role_arn      = module.iam_roles[each.value.role_key].role_arn
}

#############################################
# AWS CONFIG RULES (Compliance)
#############################################

module "config_rules" {
  source   = "./modules/config_rules"
  for_each = var.config_rules

  rule_name        = each.value.rule_name
  rule_identifier  = each.value.rule_identifier
  input_parameters = lookup(each.value, "input_parameters", null)
  depends_on = [module.aws_config]
}