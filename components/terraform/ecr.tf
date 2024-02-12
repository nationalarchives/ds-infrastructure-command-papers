module "cp-ecr" {
  source = "./ecr"

  tags = var.default_tags
}
