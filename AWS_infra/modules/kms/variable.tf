variable "description" {}
variable "alias" {}
variable "tags" {
  type = map(string)
}

variable "enable_cloudtrail" {
  type    = bool
  default = false
}
variable "region" {
  type = string
}