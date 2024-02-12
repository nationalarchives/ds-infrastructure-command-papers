resource "aws_ecr_repository" "ecr_command_paper_api" {
  provider             = "intersite"
  name                 = "command-paper-api"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository_policy" "ecr_command_paper_api_policy" {
  repository = aws_ecr_repository.ecr_command_paper_api.name
  policy = file("${path.module}/templates/eks_worker_access_ecr_policy.json")
}

resource "aws_ecr_repository" "ecr_command_paper_web" {
  provider             = "intersite"
  name                 = "command-paper-web"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository_policy" "ecr_command_paper_web_policy" {
  repository = aws_ecr_repository.ecr_command_paper_web.name
  policy = file("${path.module}/templates/eks_worker_access_ecr_policy.json")
}
