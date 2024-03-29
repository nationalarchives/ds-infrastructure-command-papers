terraform {
    required_providers {
        aws = {
            configuration_aliases = [aws.intersite, aws.environment]
        }
    }
}

resource "aws_ecr_repository" "ecr_command_paper_api" {
    provider             = aws.intersite
    name                 = "command-paper-api"
    image_tag_mutability = "IMMUTABLE"

    image_scanning_configuration {
        scan_on_push = true
    }
}

resource "aws_ecr_repository_policy" "ecr_command_paper_api_policy" {
    provider   = aws.intersite
    repository = aws_ecr_repository.ecr_command_paper_api.name
    policy     = file("${path.module}/templates/eks_worker_access_ecr_policy.json")
}

resource "aws_ecr_repository" "ecr_command_paper_web" {
    provider             = aws.intersite
    name                 = "command-paper-web"
    image_tag_mutability = "IMMUTABLE"

    image_scanning_configuration {
        scan_on_push = true
    }
}

resource "aws_ecr_repository_policy" "ecr_command_paper_web_policy" {
    provider   = aws.intersite
    repository = aws_ecr_repository.ecr_command_paper_web.name
    policy     = file("${path.module}/templates/eks_worker_access_ecr_policy.json")
}
