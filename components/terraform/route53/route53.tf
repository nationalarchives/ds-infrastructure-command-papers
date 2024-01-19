resource "aws_route53_zone" "user_pool" {
    name = var.user_pool_domain
}

resource "aws_route53_record" "user_pool" {
  zone_id = aws_route53_zone.user_pool.zone_id
  name    = var.user_pool_domain
  type    = "A"
  ttl     = 300
  records = [aws_eip.lb.public_ip]
}

resource "aws_route53_zone" "app" {
    name = var.app_domain
}
