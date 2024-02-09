## ds-infrastructure-command-papers
Build the infrastructure for Command Papers service.
### Services
- SecretsManager (ASM) creating the secrets used by Cognito
- Cognito authentication
- Simple Email Service (SES) use by Command Papers to send and receive emails
- Route53 managing DNS for Cognito and Command Papers
- System Manager - Parameter Store (SSM) delivering paramters to services and runtime environments

Lambda function cognito-signup-validation is outside the repo because otherwise the deployment would interfere with user validation. !!need to be described later.
