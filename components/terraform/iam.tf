module "policies" {
    source = "./iam/policies"

    providers = {
        aws.intersite   = aws.intersite
        aws.environment = aws.environment
    }
}

#module "roles" {
#    source = "./iam/roles"
#
#    command_papers_github_ecr_policy_arn = module.policies.command_papers_github_ecr_assume_policy_arn
#
#    providers = {
#        aws.intersite   = aws.intersite
#        aws.environment = aws.environment
#    }
#}
