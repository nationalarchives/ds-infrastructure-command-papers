resource "aws_route53_zone" "user_pool" {
    name = var.user_pool_domain
}

resource "aws_route53_record" "user_pool" {
    zone_id = aws_route53_zone.user_pool.zone_id
    name    = var.user_pool_domain
    type    = "A"
    ttl     = 300
    alias {
        evaluate_target_health = false

        name    = cloudfront_distribution
        zone_id = cloudfront_distribution_zone_id
    }
}

resource "aws_route53_zone" "app" {
    name = var.app_domain
}
