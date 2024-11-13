#!/bin/bash

# Define the IAM username and policy file
IAM_USER="secure_user"
POLICY_FILE="policy.json"

# Check for AWS CLI installation
if ! command -v aws &> /dev/null
then
    echo "AWS CLI not found. Please install AWS CLI."
    exit 1
fi

# Check for policy file
if [ ! -f "$POLICY_FILE" ]; then
    echo "Policy file $POLICY_FILE does not exist."
    exit 1
fi

# Create IAM user
echo "Creating IAM user $IAM_USER..."
aws iam create-user --user-name "$IAM_USER"

# Attach policy for minimal access (customize as per requirements)
echo "Attaching policy to $IAM_USER..."
aws iam put-user-policy --user-name "$IAM_USER" --policy-name "${IAM_USER}_policy" --policy-document file://"$POLICY_FILE"

# Generate access keys (optional, recommended only if needed)
echo "Generating access keys for $IAM_USER..."
aws iam create-access-key --user-name "$IAM_USER" > access_key.json

echo "IAM user setup completed. Access keys are saved in access_key.json (keep secure)."
