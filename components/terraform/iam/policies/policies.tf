# allow Commandpaper pods to access AWS resources
#
resource "aws_iam_policy" "command_papers_k8s_resource_access_policy" {
    name        = "command-papers-k8s-resource-access-policy"
    description = "Commandpaper pods to access AWS resources"

    policy = file("${path.root}/templates/command-papers-k8s-resource-access-policy.json")
}
