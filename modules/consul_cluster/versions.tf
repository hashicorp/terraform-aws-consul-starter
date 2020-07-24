# names required TF version
terraform {
  required_version = ">= 0.12"
  required_providers {
    aws    = "~> 2.70.0"
    random = "~> 2.3.0"
  }
}
