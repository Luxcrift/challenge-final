# Definir grupo de seguridad puerto 80 servidores
resource "aws_security_group" "develop" {
    name = "${var.app}-${var.envdev}-sg"
    vpc_id = module.vpc.vpc_id

    ingress {
      cidr_blocks = ["0.0.0.0/0" ]
      description = "Acceso al puerto 80"
      from_port = 80
      to_port = 80
      protocol = "TCP"
    } 
    ingress {
      cidr_blocks = ["0.0.0.0/0" ]
      description = "Acceso al puerto 22"
      from_port = 22
      to_port = 22
      protocol = "TCP"
    } 
    ingress {
      cidr_blocks = ["0.0.0.0/0" ]
      description = "Acceso al puerto 3000-3002"
      from_port = 3000
      to_port = 3002
      protocol = "TCP"
    }
    ingress {
      cidr_blocks = ["0.0.0.0/0" ]
      description = "Acceso al puerto https"
      from_port = 443
      to_port = 443
      protocol = "TCP"
    }
    ingress {
      cidr_blocks = ["0.0.0.0/0" ]
      description = "Acceso al puerto https"
      from_port = 8080
      to_port = 8080
      protocol = "TCP"
    }

    egress {
      cidr_blocks = ["0.0.0.0/0"]
      description = "All trafic"
      from_port = 0
      to_port = 0
      protocol = "-1"
    } 
}

resource "aws_security_group" "testing" {
    name = "${var.app}-${var.envtst}-sg"
    vpc_id = module.vpc.vpc_id

    ingress {
      cidr_blocks = ["0.0.0.0/0" ]
      description = "Acceso al puerto 80"
      from_port = 80
      to_port = 80
      protocol = "TCP"
    } 
    ingress {
      cidr_blocks = ["0.0.0.0/0" ]
      description = "Acceso al puerto 22"
      from_port = 22
      to_port = 22
      protocol = "TCP"
    } 
    ingress {
      cidr_blocks = ["0.0.0.0/0" ]
      description = "Acceso al puerto 3000-3002"
      from_port = 3000
      to_port = 3002
      protocol = "TCP"
    }
    ingress {
      cidr_blocks = ["0.0.0.0/0" ]
      description = "Acceso al puerto https"
      from_port = 443
      to_port = 443
      protocol = "TCP"
    }

    egress {
      cidr_blocks = ["0.0.0.0/0"]
      description = "All trafic"
      from_port = 0
      to_port = 0
      protocol = "-1"
    } 
}

resource "aws_security_group" "prod" {
    name = "${var.app}-${var.envprd}-sg"
    vpc_id = module.vpc.vpc_id

    ingress {
      cidr_blocks = ["0.0.0.0/0" ]
      description = "Acceso al puerto 80"
      from_port = 80
      to_port = 80
      protocol = "TCP"
    } 
    ingress {
      cidr_blocks = ["0.0.0.0/0" ]
      description = "Acceso al puerto 22"
      from_port = 22
      to_port = 22
      protocol = "TCP"
    } 
    ingress {
      cidr_blocks = ["0.0.0.0/0" ]
      description = "Acceso al puerto 3000-3002"
      from_port = 3000
      to_port = 3002
      protocol = "TCP"
    }
    ingress {
      cidr_blocks = ["0.0.0.0/0" ]
      description = "Acceso al puerto https"
      from_port = 443
      to_port = 443
      protocol = "TCP"
    }

    egress {
      cidr_blocks = ["0.0.0.0/0"]
      description = "All trafic"
      from_port = 0
      to_port = 0
      protocol = "-1"
    } 
}
