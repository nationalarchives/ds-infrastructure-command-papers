# allow Commandpaper pods to access AWS resources
#
resource "aws_iam_policy" "command_papers_k8s_resource_access_policy" {
    name        = "command-papers-k8s-resource-access-policy"
    description = "Commandpaper pods to access AWS resources"

    policy = file("${path.module}/templates/command-papers-k8s-resource-access-policy.json")
}

resource "aws_iam_policy" "command_papers_github_ecr_access_policy" {
    provider = aws.intersite

    name        = "command-papers-github-ecr-access-policy"
    description = "GitHub Action push to ECR"

    policy = file("${path.module}/templates/command-papers-github-ecr-access-policy.json")
}
