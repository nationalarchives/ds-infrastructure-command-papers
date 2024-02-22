data "aws_ssm_parameter" "cp_certificate_arn" {
    name = "/infrastructure/certificate-manager/us-east-1-wildcard-certificate-arn"
}

data "aws_caller_identity" "current" {}

