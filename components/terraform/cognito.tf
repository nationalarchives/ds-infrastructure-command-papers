variable "commandpapers_callback_url" {}
variable "commandpapers_logout_url" {}
variable "ses_sysdev_arn" {}
variable "ses_sysdev_email" {}

module "cp-cognito" {
    source = "./cognito"

    cognito_user_pool_name = "commandpapers-cognito-user-pool"
    user_pool_client_name = "commandpapers-client"

    commandpapers_callback_url = var.commandpapers_callback_url
    commandpapers_logout_url   = var.commandpapers_logout_url

    ses_sysdev_arn   = var.ses_sysdev_arn
    ses_sysdev_email = var.ses_sysdev_email

    certificate_arn = data.aws_ssm_parameter.cp_certificate_arn.value

    tags = var.tags
}
