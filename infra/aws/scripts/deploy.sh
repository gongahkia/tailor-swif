#!/bin/bash
set -e

ENVIRONMENT=${1:-dev}
TERRAFORM_DIR="$(dirname "$0")/../terraform"
CFN_DIR="$(dirname "$0")/../cloudformation"

echo "Deploying Tailor Swif infrastructure for environment: $ENVIRONMENT"

if [ -d "$TERRAFORM_DIR/environments/$ENVIRONMENT" ]; then
  cd "$TERRAFORM_DIR"
  terraform init -backend-config="environments/$ENVIRONMENT/terraform.tfvars"
  terraform apply -var-file="environments/$ENVIRONMENT/terraform.tfvars" -auto-approve
else
  echo "No Terraform environment found for $ENVIRONMENT, skipping Terraform."
fi

if [ -f "$CFN_DIR/stack.yaml" ]; then
  STACK_NAME="tailor-swif-$ENVIRONMENT"
  aws cloudformation deploy \
    --template-file "$CFN_DIR/stack.yaml" \
    --stack-name "$STACK_NAME" \
    --capabilities CAPABILITY_NAMED_IAM \
    --parameter-overrides Environment=$ENVIRONMENT
else
  echo "No CloudFormation template found, skipping CloudFormation."
fi

echo "Deployment complete."