terraform {
  required_providers {
    aws = {
      configuration_aliases = [ aws.intersite, aws.environment ]
    }
  }
}

module "cp-ecr" {
  source = "./ecr"
}
