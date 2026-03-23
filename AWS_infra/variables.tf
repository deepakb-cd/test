#################################################
# PROVIDER CONFIGURATION
#################################################

variable "region" {
  description = "AWS region"
  type        = string
}

variable "common_tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
}

##############################################
# S3 BUCKETS CONFIGURATION
##############################################

variable "s3_buckets" {
  description = "Map of S3 bucket configurations"

  type = map(object({
    bucket_name = string
    tags        = map(string)
    object_keys = list(string)
  }))
}

####################################################
# IAM ROLES CONFIGURATION
####################################################

variable "iam_roles" {
  description = "Map of IAM roles with policies and configurations"

  type = map(object({
    role_name           = string
    assume_role_policy  = string
    managed_policy_arns = list(string)

    # Optional inline policy
    inline_policy_json  = optional(string)

    # Tags
    tags = map(string)
  }))
}


############################################
# CONFIG SETUP
############################################

variable "config_setups" {
  type = map(object({
    recorder_name = string
    channel_name  = string
    bucket_ref    = string
    role_key      = string
  }))
}

############################################
# CONFIG RULES
############################################

variable "config_rules" {
  type = map(object({
    rule_name        = string
    rule_identifier  = string
    input_parameters = optional(string)
  }))
}

#############################################
# CLOUDTRAILS
#############################################

variable "cloudtrails" {
  description = "CloudTrail configurations"

  type = map(object({
    name       = string
    bucket_ref = string
    tags       = map(string)
  }))
}

#############################################
# KMS KEYS
#############################################

variable "kms_keys" {
  description = "Map of KMS keys"

  type = map(object({
    description = string
    alias       = string
    key_policy  = string
    tags        = map(string)
  }))
}

############################################
# LAKEFORMATION RESOURCES
############################################

variable "lakeformation_resources" {
  type = map(object({
    bucket_ref = string
  }))
}

############################################
# LAKEFORMATION PERMISSIONS
############################################

variable "lake_permissions" {
  type = map(object({
    principal   = string
    permissions = list(string)
    bucket_ref  = string
  }))
}