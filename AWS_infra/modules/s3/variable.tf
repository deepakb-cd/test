variable "bucket_name" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "versioning" {
  type    = string
  default = "Enabled"
}

variable "encryption" {
  type    = string
  default = "AES256"
}

variable "block_public" {
  type    = bool
  default = true
}

variable "object_keys" {
  type    = list(string)
  default = []
}

variable "enable_cloudtrail_policy" {
  type    = bool
  default = false
}