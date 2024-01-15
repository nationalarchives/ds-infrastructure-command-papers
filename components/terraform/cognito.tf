variable "commandpapers_callback_url" {}
variable "commandpapers_logout_url" {}

module "cp-cognito" {
    source = "./cognito"

    cognito_user_pool_name = "commandpapers-cognito-user-pool"
    user_pool_client_name = "commandpapers-client"

    commandpapers_callback_url = var.commandpapers_callback_url
    commandpapers_logout_url   = var.commandpapers_logout_url

    ses_sysdev_arn   = module.cp-ses.ses_arn
    ses_sysdev_email = module.cp-ses.ses_email_address

    certificate_arn = data.aws_ssm_parameter.cp_certificate_arn.value

    tags = var.default_tags
}
