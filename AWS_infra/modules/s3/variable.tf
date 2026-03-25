variable "bucket_name" {}
variable "tags" { type = map(string) }
variable "versioning" {}
variable "encryption" {}
variable "block_public" {}
variable "object_keys" { type = list(string) }

variable "enable_cloudtrail_policy" {
  type    = bool
  default = false
}

# 🔥 IMPORTANT
variable "s3_key_prefix" {
  type    = string
  default = ""
}