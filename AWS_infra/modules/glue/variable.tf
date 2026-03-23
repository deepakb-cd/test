variable "db_name" {
  description = "Glue database name"
}

variable "tags" {
  type        = map(string)
  default     = {}
}