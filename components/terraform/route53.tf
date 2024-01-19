variable "user_pool_domain" {}
variable "app_domain" {}

module "cp-route53" {
    source = "./route53"

    user_pool_domain = var.user_pool_domain
    app_domain       = var.app_domain

    cloudfront_distribution = module.cp-cognito.cognito_cloudfront_distribution
    cloudfront_distribution_zone_id = module.cp-cognito.cognito_cloudfront_distribution_zone_id
}
