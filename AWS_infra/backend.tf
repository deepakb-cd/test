terraform {
  backend "s3" {
    bucket         = "deepak-terraform-state-123456"
    key            = "s3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
  }
}