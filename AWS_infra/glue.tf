############################################
# GLUE DATA CATALOG DATABASE
############################################

module "glue" {
  source   = "./modules/glue"
  for_each = var.glue_databases

  db_name = each.value.db_name
  tags    = each.value.tags
}

##############################################
# GLUE CRAWLER
###############################################
variable "glue_databases" {
  description = "Map of Glue databases"

  type = map(object({
    db_name = string
    tags    = map(string)
  }))
}