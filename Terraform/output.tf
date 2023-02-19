output "dns_publica_develop" {
    description = "DNS publica del servidor Develop"
    value = "http://${aws_instance.develop.public_ip}.sslip.io"
}
output "dns_publica_testing" {
    description = "DNS publica del servidor testing"
    value = "http://${aws_instance.testing.public_ip}.sslip.io"
}
output "dns_publica_prod" {
    description = "DNS publica del servidor Prod"
    value = "http://${aws_instance.prod.public_ip}.sslip.io"
}