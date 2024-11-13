# AWS IAM Non-Root User Setup Script

This repository provides a simple Bash script to automate the setup of IAM non-root users in AWS. By following the principles outlined in the AWS IAM Architecture, this script helps establish a secure foundation for managing access to your AWS resources.

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Script Description](#script-description)
- [Policy File](#policy-file)
- [Usage](#usage)
- [AWS IAM Architecture](#aws-iam-architecture)
- [Best Practices](#best-practices)
- [License](#license)

## **Overview**

This script is designed to improve the security of your AWS account by creating non-root IAM users with minimal access permissions. It follows AWS IAM best practices, such as granting only necessary permissions, enforcing key rotation, and using JSON policy documents.

## **Prerequisites**

- **AWS CLI**: Ensure the AWS CLI is installed and configured with the appropriate credentials.
- **Policy Document**: Create a JSON file (policy.json) that defines the minimal permissions required for the IAM user.

## **Script Description**

The script performs the following actions:

1. **Checks for AWS CLI installation**: Ensures the AWS CLI is installed.
2. **Creates an IAM User**: Creates a non-root user with the specified username.
3. **Attaches Policy**: Attaches a custom policy from a JSON file to define the user's permissions.
4. **Generates Access Keys (Optional)**: Generates and saves access keys for programmatic access.

**Note**: The script is customizable, allowing you to define different policies for various users as per your requirements.

## **Policy File**

Below is an example of a minimal policy (policy.json) that allows basic read-only access to S3 and EC2 resources.
```
{

"Version": "2012-10-17",

"Statement": [

{

"Effect": "Allow",

"Action": [

"s3:ListBucket",

"s3:GetObject",

"ec2:DescribeInstances"

],

"Resource": "*"

}

]

}
```

Customize this file to suit your security requirements.

## **Usage**

Clone the repository: 
``` 
git clone <https://github.com/ismail-rt/aws-iam-setup-script.git>

cd aws-iam-setup-script
```
1. Modify the policy.json file if necessary.
```
Run the script:  
bash setup_iam_user.sh
```

1. Review the output file access_key.json for the generated access keys (if created). **Keep this file secure**.

## **AWS IAM Architecture**

The following mind map illustrates the AWS IAM architecture and components:

- **IAM Users**: Permissions, Multi-Factor Authentication (MFA)
- **IAM Groups**: Group Policies, Role-Based Access Control
- **IAM Roles**: Trust Relationships, Role Policies, Cross-Account Access
- **IAM Policies**: Managed Policies, Inline Policies, Policy Documents (JSON)
- **Access Keys**: Programmatic Access, Key Rotation
- **Permissions Boundaries**: Define access limits for users and roles
- **Identity Federation**: SAML 2.0, Web Identity Federation, Single Sign-On (SSO)
- **Resource Access Manager (RAM)**: Share resources across accounts
- **Monitoring & Logging**: CloudTrail, IAM Access Analyzer

For visual reference, please see the AWS IAM Architecture mind map created for this project.

![AWS IAM Architecture mind map](https://raw.githubusercontent.com/ismail-rt/aws-iam-setup-script/refs/heads/main/aws-iam-Architecture.jpg?raw=true)
## **Best Practices**

- **Use MFA**: Enable Multi-Factor Authentication for all IAM users.
- **Limit Permissions**: Grant only the permissions necessary for each user or role.
- **Rotate Access Keys**: Regularly rotate access keys and avoid long-term use.
- **Monitor with CloudTrail**: Enable AWS CloudTrail for monitoring IAM actions.

## **License**

This project is licensed under the MIT License.
