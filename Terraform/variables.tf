locals {
  common_tags = {
    Terraform = "true"
    Owner = "DevOps Team"
    Project = "${var.app}-devops"
  }
}
variable "app" {}
variable "envdev" {}
variable "envtst" {}
variable "envprd" {}
variable "ami" {}
variable "instance_type" {}
variable "key" {
    default = "temporal"
}