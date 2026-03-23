resource "aws_config_configuration_recorder" "this" {
  name     = var.recorder_name
  role_arn = var.role_arn
}

resource "aws_config_delivery_channel" "this" {
  name           = var.channel_name
  s3_bucket_name = var.bucket_name
}

resource "aws_config_configuration_recorder_status" "this" {
  name       = aws_config_configuration_recorder.this.name
  is_enabled = true
}