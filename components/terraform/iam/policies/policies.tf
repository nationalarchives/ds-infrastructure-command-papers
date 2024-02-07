# allow Commandpaper pods to access AWS resources
#
resource "aws_iam_policy" "commandpaper_policy" {
    name        = "commandpaper-policy"
    description = "Commandpaper pods to access AWS resources"

    policy = file("${path.root}/templates/commandpaper-policy.json")
}
