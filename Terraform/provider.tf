provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "github-gfm"
    key = "global/mystatefile/terraform.tfstate"
    region = "us-east-1"

  }
}
