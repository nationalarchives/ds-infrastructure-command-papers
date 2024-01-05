module "cp_asm" {
    source = "./asm"

    cognito_user_pool_id = module.cp-cognito.cognito_user_pool_id
    cognito_user_pool_client_secret = module.cp-cognito.cognito_client_secret
    cognito_client_pool_id = module.cp-cognito.cognito_client_id

    tags = var.tags
}
