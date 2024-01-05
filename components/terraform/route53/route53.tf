resource "aws_route53_zone" "user_pool" {
    name = var.user_pool_domain
}

resource "aws_route53_zone" "app" {
    name = var.app_domain
}
