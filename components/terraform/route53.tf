variable "user_pool_domain" {}
variable "app_domain" {}

variable "site_domain" {}
variable "site_target" {}
variable "lb_zone_id" {}

variable "local_zone_id" {}
variable "local_api_domain" {}
variable "local_api_target" {}

module "cp-route53" {
    source = "./route53"

    user_pool_domain = var.user_pool_domain
    app_domain       = var.app_domain

    cloudfront_distribution         = module.cp-cognito.cognito_cloudfront_distribution
    cloudfront_distribution_zone_id = module.cp-cognito.cognito_cloudfront_distribution_zone_id

    site_domain = var.site_domain
    site_target = var.site_target
    lb_zone_id  = var.lb_zone_id

    local_zone_id    = var.local_zone_id
    local_api_domain = var.local_api_domain
    local_api_target = var.local_api_target
}
