terraform {
    backend "s3" {
        bucket = "ds-terraform-state-eu-west-2-337670467269"
        key    = "ds-infrastructure-command-papers/terraform.tfstate"
        region = "eu-west-2"
    }
}

provider "aws" {
    region  = "eu-west-2"
    alias   = "intersite"

    assume_role {
        role_arn    = "arn:aws:iam::500447081210:role/github-actions-xacct"
    }
}

provider "aws" {
    region  = "eu-west-2"
    alias   = "environment"
}

# this provider is used for command line to  suppress input for region
provider "aws" {
    region  = "eu-west-2"
}
