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

#############################################
# S3 BUCKETS CONFIGURATION
#############################################

# variable "s3_buckets" {
#   description = "Map of S3 bucket configurations"

#   type = map(object({
#     bucket_name = string
#     tags        = map(string)
#     object_keys = list(string)
#   }))
# }

####################################################
# IAM ROLES CONFIGURATION
####################################################

variable "iam_roles" {
  description = "IAM roles configuration"

  type = map(object({
    role_name           = string
    service             = string
    managed_policy_arns = list(string)
    tags                = map(string)
  }))
}
# ############################################
# # CONFIG SETUP
# ############################################

# variable "config_setups" {
#   type = map(object({
#     recorder_name = string
#     channel_name  = string
#     bucket_ref    = string
#     role_key      = string
#   }))
# }

# ############################################
# # CONFIG RULES
# ############################################

# variable "config_rules" {
#   type = map(object({
#     rule_name        = string
#     rule_identifier  = string
#     input_parameters = optional(string)
#   }))
# }

#############################################
# CLOUDTRAILS
#############################################

# variable "cloudtrails" {
#   description = "CloudTrail configurations"

#   type = map(object({
#     name       = string
#     bucket_ref = string
#     tags       = map(string)
#   }))
# }

#############################################
# KMS KEYS
#############################################

variable "kms_keys" {
  type = map(object({
    description       = string
    alias             = string
    tags              = map(string)
    enable_cloudtrail = bool
  }))
}
# ############################################
# # LAKEFORMATION RESOURCES
# ############################################

# variable "lakeformation_resources" {
#   type = map(object({
#     bucket_ref = string
#   }))
# }

# ############################################
# # LAKEFORMATION PERMISSIONS
# ############################################

# variable "lake_permissions" {
#   type = map(object({
#     principal   = string
#     permissions = list(string)
#     bucket_ref  = string
#   }))
# }


#####################
# variable "region" {
# default = "ap-south-1"
# }

# variable "instance_type" {
#   default = "t3.medium"
# }

# variable "ami_id" {
#   description = "Ubuntu AMI ID"
# }

# variable "key_name" {
#   description = "EC2 Key Pair Name"
# }

# variable "my_ip" {
#   description = "Your IP for SSH access (e.g. 1.2.3.4/32)"
# }

# variable "subnet_id" {
#   description = "Subnet ID"
# }

# variable "security_group_id" {
#   description = "Existing Security Group ID"
# }