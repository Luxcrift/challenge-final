provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "challenge-diosito-123"
    key = "global/mystatefile/terraform.tfstate"
    region = "us-east-1"

  }
}
