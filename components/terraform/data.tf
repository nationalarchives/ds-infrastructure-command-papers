data "aws_ssm_parameter" "cp_certificate_arn" {
    name = "/infrastructure/certificate-manager/wildcard-certificate-arn"
}
