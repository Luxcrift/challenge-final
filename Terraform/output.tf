output "dns_publica_develop" {
    description = "DNS publica del servidor Develop"
    value = "https://${aws_instance.develop.public_ip}.sslip.io"
}
output "dns_publica_testing" {
    description = "DNS publica del servidor testing"
    value = "https://${aws_instance.testing.public_ip}.sslip.io"
}
output "dns_publica_prod" {
    description = "DNS publica del servidor Prod"
    value = "https://${aws_instance.prod.public_ip}.sslip.io"
}
