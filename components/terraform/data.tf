data "aws_ssm_parameter" "cp_certificate_arn" {
    name = "/certificate-manager/eu-west-2/wildcard-certificate-arn"
}
