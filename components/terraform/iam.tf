module "policies" {
    source = "./iam/policies"
}

module "roles" {
    source = "./iam/roles"

    command_papers_github_ecr_policy_arn = module.policies.command_papers_github_ecr_assume_policy_arn
}
