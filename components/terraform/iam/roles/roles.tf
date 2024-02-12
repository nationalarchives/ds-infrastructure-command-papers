variable "command_papers_github_ecr_policy_arn" {}

resource "aws_iam_role" "command_papers_github_ecr_assume_role" {
    provider = aws.intersite

    name               = "command-papers-github-ecr-assume-role"
    assume_role_policy = file("${path.module}/templates/command-papers-github-ecr-assume-role.json")

    managed_policy_arns = [
        var.command_papers_github_ecr_policy_arn
    ]

    description = "enable github action to auth and push docker images to command papers ECR"
}
