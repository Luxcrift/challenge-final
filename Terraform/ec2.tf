resource "aws_instance" "develop" {
    ami = "${var.ami}"
    instance_type = "${var.instance_type}"
    subnet_id = module.vpc.public_subnets[0]
    vpc_security_group_ids = [ aws_security_group.develop.id ]
    key_name = "${var.key}"
    tags = {
      "Name" = "${var.app}-ec2-${var.envdev}"
      "Infra" = "Terraform"
      "Owner" = "DevOps Team"
    }
    user_data = file("https.sh")
}
resource "aws_instance" "testing" {
    ami = "${var.ami}"
    instance_type = "${var.instance_type}"
    subnet_id = module.vpc.public_subnets[0]
    vpc_security_group_ids = [ aws_security_group.testing.id ]
    key_name = "${var.key}"
    tags = {
      "Name" = "${var.app}-ec2-${var.envtst}"
      "Infra" = "Terraform"
      "Owner" = "DevOps Team"
    }
    user_data = file("https.sh")
}

resource "aws_instance" "prod" {
    ami = "${var.ami}"
    instance_type = "${var.instance_type}"
    subnet_id = module.vpc.public_subnets[0]
    vpc_security_group_ids = [ aws_security_group.prod.id ]
    key_name = "${var.key}"
    tags = {
      "Name" = "${var.app}-ec2-${var.envprd}"
      "Infra" = "Terraform"
      "Owner" = "DevOps Team"
    }
    user_data = file("https.sh")
}
