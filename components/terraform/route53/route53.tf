resource "aws_route53_zone" "user_pool" {
    name = var.user_pool_domain
}

resource "aws_route53_record" "user_pool" {
    zone_id = aws_route53_zone.user_pool.zone_id
    name    = var.user_pool_domain
    type    = "A"
    alias {
        evaluate_target_health = false

        name    = var.cloudfront_distribution
        zone_id = var.cloudfront_distribution_zone_id
    }
}

resource "aws_route53_zone" "app" {
    name = var.app_domain
}

resource "aws_route53_zone" "site" {
    name = var.site_domain
}

resource "aws_route53_record" "site" {
    zone_id = aws_route53_zone.site.zone_id
    name    = var.site_domain
    type    = "A"
    alias {
        evaluate_target_health = true

        name    = var.site_target
        zone_id = var.lb_zone_id
    }
}

resource "aws_route53_record" "local" {
    zone_id = var.local_zone_id
    name    = var.local_api_domain
    type    = "CNAME"
    ttl     = 5

    records = [
        var.local_api_target,
    ]
}
