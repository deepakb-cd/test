resource "aws_config_config_rule" "this" {
  name = var.rule_name

  source {
    owner             = "AWS"
    source_identifier = var.rule_identifier
  }

  input_parameters = var.input_parameters
}