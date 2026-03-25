######################################################
# PROVIDER CONFIGURATION
######################################################

region = "us-east-1"

common_tags = {
  Project     = "DataLake"
  Environment = "Dev"
  Owner       = ""
}


######################################################
# S3 BUCKETS CONFIGURATION
######################################################


s3_buckets = {
  B1 = {
    bucket_name = "demo-data-lake-bucket-1234"
    tags = {
      Environment = "Prod"
      Project     = "DataLake"
    }
    object_keys = ["o1/", "o2/", "o3/"]
  }

  # B2 = {
  #   bucket_name = ""
  #   tags = {
  #     Environment = ""
  #     Project     = ""
  #   }
  #   object_keys = ["/", "/", "/"]
  # }

  # B3 = {
  #   bucket_name = ""
  #   tags = {
  #     Environment = ""
  #     Project     = ""
  #   }
  #   object_keys = ["/", "/", "/"]
  # }
}

###############################################
# IAM ROLES CONFIGURATION   
############################################### 

iam_roles = {

  datalake = {
    role_name = "datalake-role"
    service   = "glue.amazonaws.com"

    managed_policy_arns = [
      "arn:aws:iam::aws:policy/AmazonS3FullAccess",
      "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
    ]

    tags = {
      Environment = "Prod"
      Purpose     = "datalake"
    }
  }

  # ✅ AWS Config Role
  config = {
    role_name = "aws-config-role"
    service   = "config.amazonaws.com"

    managed_policy_arns = [
      "arn:aws:iam::aws:policy/service-role/AWS_ConfigRole"
    ]

    tags = {
      Environment = "Prod"
      Purpose     = "compliance"
    }
  }
}
# ############################################
# # CONFIG SETUP EXAMPLE
# ############################################

# config_setups = {
#   dev = {
#     recorder_name = "config-recorder-dev"
#     channel_name  = "config-channel-dev"
#     bucket_ref    = "dev"
#     role_key      = "config"
#   }
# }

# ############################################
# # CONFIG RULES EXAMPLE
# ############################################

# config_rules = {
#   s3_public_block = {
#     rule_name       = "s3-public-read-prohibited"
#     rule_identifier = "S3_BUCKET_PUBLIC_READ_PROHIBITED"
#   }

#   s3_encryption = {
#     rule_name       = "s3-encryption-enabled"
#     rule_identifier = "S3_BUCKET_SERVER_SIDE_ENCRYPTION_ENABLED"
#   }

#   required_tags = {
#     rule_name       = "required-tags"
#     rule_identifier = "REQUIRED_TAGS"
#     input_parameters = jsonencode({
#       tag1Key = "Environment"
#       tag2Key = "Owner"
#     })
#   }
# }

# ###########################################################
# #CLOUDTRAILS CONFIGURATION EXAMPLE
# ###########################################################
cloudtrails = {

  prod = {
    name       = "cloudtrail-prod"
    bucket_ref = "B1"

    tags = {
      Environment = "Prod"
      Project     = "DataLake"
    }
  }
}

# ###########################################################
# # GLUE CATALOG DATABASE CONFIGURATION EXAMPLE
# ###########################################################
# glue_databases = {
#   dev = {
#     db_name = "dev_data_lake_db"

#     tags = {
#       Environment = "Dev"
#       Project     = "DataLake"
#     }
#   }

#   prod = {
#     db_name = "prod_data_lake_db"

#     tags = {
#       Environment = "Prod"
#       Project     = "DataLake"
#     }
#   }
# }

#############################################################
# KMS KEYS CONFIGURATION EXAMPLE
#############################################################
kms_keys = {
  cloudtrail = {
    description       = "CloudTrail KMS Key"
    alias             = "alias/cloudtrail-key"
    enable_cloudtrail = true

    tags = {
      Name = "cloudtrail-kms"
    }
  }

}

# ############################################
# # REGISTER RESOURCES
# ############################################

# lakeformation_resources = {
#   dev = {
#     bucket_ref = "dev"
#   }

#   prod = {
#     bucket_ref = "prod"
#   }
# }

# ############################################
# # PERMISSIONS
# ############################################

# lake_permissions = {
#   analyst = {
#     principal   = "arn:aws:iam::123456789012:role/analyst-role"
#     permissions = ["SELECT"]
#     bucket_ref  = "dev"
#   }

#   engineer = {
#     principal   = "arn:aws:iam::123456789012:role/engineer-role"
#     permissions = ["ALL"]
#     bucket_ref  = "dev"
#   }
# }

# ami_id            = "ami-0ec10929233384c7f" # Ubuntu AMI (update this)
# key_name          = "splunknew"
# my_ip             = "192.168.2.55/32"
# subnet_id         = "subnet-04586d7b0cedcb7ff"
# security_group_id = "sg-00ab5521680bfde73"