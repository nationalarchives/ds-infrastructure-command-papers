output "cognito_pool_arn" {
  value = aws_cognito_user_pool.cognito_user_pool.arn
}

output "Cognito_UserPoolId" {
  value = aws_cognito_user_pool.cognito_user_pool.id
}

output "Cognito_ClientId" {
  value = aws_cognito_user_pool_client.user_pool_client.id
}

output "Cognito_ClientSecret" {
  value = aws_cognito_user_pool_client.user_pool_client.client_secret
}
