resource "aws_cognito_user_pool" "cognito_user_pool" {
    name = var.cognito_user_pool_name

    auto_verified_attributes = [
        "email",
    ]

    email_configuration {
        source_arn             = var.ses_sysdev_arn
        reply_to_email_address = var.ses_sysdev_email
        email_sending_account  = "DEVELOPER"
    }

    password_policy {
        minimum_length    = 8
        require_lowercase = true
        require_numbers   = true
        require_symbols   = true
        require_uppercase = true
    }

    schema {
        attribute_data_type      = "String"
        developer_only_attribute = false
        mutable                  = true
        name                     = "email"
        required                 = true

        string_attribute_constraints {
            min_length = 1
            max_length = 2048
        }
    }

    schema {
        attribute_data_type      = "String"
        developer_only_attribute = false
        mutable                  = true
        name                     = "name"
        required                 = true

        string_attribute_constraints {
            min_length = 1
            max_length = 2048
        }
    }

    schema {
        attribute_data_type      = "String"
        developer_only_attribute = false
        mutable                  = true
        name                     = "department"
        required                 = false

        string_attribute_constraints {
            min_length = 1
            max_length = 256
        }
    }

    tags = merge( var.tags, {
        "Name" = var.cognito_user_pool_name
    })
}

resource "aws_cognito_user_pool_domain" "user_pool" {
    certificate_arn = var.certificate_arn
    domain       = var.user_pool_domain
    user_pool_id = aws_cognito_user_pool.cognito_user_pool.id
}

resource "aws_cognito_user_pool_ui_customization" "user_pool_ui" {
    client_id = aws_cognito_user_pool_client.user_pool_client.id

    css        = file("${path.module}/ui/client.css")
    image_file = filebase64("${path.module}/ui/logo-white.png")

    user_pool_id = aws_cognito_user_pool_domain.user_pool.user_pool_id
}

resource "aws_cognito_user_pool_client" "user_pool_client" {
    name = var.user_pool_client_name

    user_pool_id           = aws_cognito_user_pool.cognito_user_pool.id
    generate_secret        = true
    refresh_token_validity = 1

    allowed_oauth_flows_user_pool_client = true

    callback_urls = [
        var.commandpapers_callback_url
    ]

    logout_urls = [
        var.commandpapers_logout_url
    ]

    supported_identity_providers = [
        "COGNITO"
    ]

    allowed_oauth_flows = [
        "code"
    ]

    allowed_oauth_scopes = [
        "email",
        "openid",
        "profile",
        "aws.cognito.signin.user.admin",
    ]

    read_attributes = [
        "email",
        "name",
        "custom:department",
    ]

    write_attributes = [
        "email",
        "name",
        "custom:department",
    ]
}

resource "aws_cognito_user_group" "admin_group" {
    name         = "Admin"
    user_pool_id = aws_cognito_user_pool.cognito_user_pool.id
    description  = "application administrator"
}

resource "aws_cognito_user_group" "other_dept_group" {
    name         = "CMDP_OGD"
    user_pool_id = aws_cognito_user_pool.cognito_user_pool.id
    description  = "other government department users"
}

resource "aws_cognito_user_group" "tna_group" {
    name         = "CMDP_TNA"
    user_pool_id = aws_cognito_user_pool.cognito_user_pool.id
    description  = "TNA users"
}

resource "aws_cognito_user_pool_ui_customization" "cp_cognito" {
    client_id = aws_cognito_user_pool_client.user_pool_client.id

    css        = ".label-customizable {font-weight: 400;}"
    image_file = filebase64("${path.module}/ui/logo-white.png")

    # Refer to the aws_cognito_user_pool_domain resource's
    # user_pool_id attribute to ensure it is in an 'Active' state
    user_pool_id = aws_cognito_user_pool_domain.user_pool.user_pool_id
}
