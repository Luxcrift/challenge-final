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
    user_data = <<EOF
#!/bin/bash
DOMAIN=$(curl icanhazip.com)
SSLIP="$DOMAIN.sslip.io"
sudo yum update -y
sudo yum install -y wget zip unzip docker git jq
sudo amazon-linux-extras install nginx1 java-openjdk11 -y 
sudo amazon-linux-extras install epel -y
sudo systemctl enable nginx
sudo systemctl start nginx
sudo service docker start
sudo usermod -a -G docker ec2-user 
DC_VERSION=$(curl -L -s -H 'Accept: application/json' https://github.com/docker/compose/releases/latest | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')
sudo curl -L "https://github.com/docker/compose/releases/download/$DC_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo service docker restart
sudo yum install -y certbot python2-certbot-nginx
sudo certbot --nginx --register-unsafely-without-email --agree-tos -d $SSLIP --cert-name nginx
sudo usermod -aG docker nginx
sudo service docker restart
EOF
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
    user_data = <<EOF
#!/bin/bash
DOMAIN=$(curl icanhazip.com)
SSLIP="$DOMAIN.sslip.io"
sudo yum update -y
sudo yum install -y wget zip unzip docker git jq
sudo amazon-linux-extras install nginx1 java-openjdk11 -y 
sudo amazon-linux-extras install epel -y
sudo systemctl enable nginx
sudo systemctl start nginx
sudo service docker start
sudo usermod -a -G docker ec2-user 
DC_VERSION=$(curl -L -s -H 'Accept: application/json' https://github.com/docker/compose/releases/latest | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')
sudo curl -L "https://github.com/docker/compose/releases/download/$DC_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo service docker restart
sudo yum install -y certbot python2-certbot-nginx
sudo certbot --nginx --register-unsafely-without-email --agree-tos -d $SSLIP --cert-name nginx
sudo usermod -aG docker nginx
sudo service docker restart
EOF
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
    user_data = <<EOF
#!/bin/bash
DOMAIN=$(curl icanhazip.com)
SSLIP="$DOMAIN.sslip.io"
sudo yum update -y
sudo yum install -y wget zip unzip docker git jq
sudo amazon-linux-extras install nginx1 java-openjdk11 -y 
sudo amazon-linux-extras install epel -y
sudo systemctl enable nginx
sudo systemctl start nginx
sudo service docker start
sudo usermod -a -G docker ec2-user 
DC_VERSION=$(curl -L -s -H 'Accept: application/json' https://github.com/docker/compose/releases/latest | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')
sudo curl -L "https://github.com/docker/compose/releases/download/$DC_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo service docker restart
sudo yum install -y certbot python2-certbot-nginx
sudo certbot --nginx --register-unsafely-without-email --agree-tos -d $SSLIP --cert-name nginx
sudo usermod -aG docker nginx
sudo service docker restart
EOF
}