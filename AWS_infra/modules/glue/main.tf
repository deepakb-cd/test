resource "aws_glue_catalog_database" "this" {
  name = var.db_name

  tags = var.tags
}