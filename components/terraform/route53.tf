variable "user_pool_domain" {}
variable "app_domain" {}

module "cp-route53" {
    source = "./route53"

    user_pool_domain = var.user_pool_domain
    app_domain       = var.app_domain

    user_pool_endpoint = module.cp-cognito.cognito_endpoint
}
