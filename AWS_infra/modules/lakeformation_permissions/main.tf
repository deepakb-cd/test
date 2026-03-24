# resource "aws_lakeformation_permissions" "this" {
#   principal   = var.principal
#   permissions = var.permissions

#   data_location {
#     arn = var.resource_arn
#   }
# }