#!/bin/bash
set -e

ENVIRONMENT=${1:-dev}
TERRAFORM_DIR="$(dirname "$0")/../terraform"
CFN_DIR="$(dirname "$0")/../cloudformation"

echo "Tearing down Tailor Swif infrastructure for environment: $ENVIRONMENT"

if [ -d "$TERRAFORM_DIR/environments/$ENVIRONMENT" ]; then
  cd "$TERRAFORM_DIR"
  terraform destroy -var-file="environments/$ENVIRONMENT/terraform.tfvars" -auto-approve
else
  echo "No Terraform environment found for $ENVIRONMENT, skipping Terraform."
fi

if [ -f "$CFN_DIR/stack.yaml" ]; then
  STACK_NAME="tailor-swif-$ENVIRONMENT"
  aws cloudformation delete-stack --stack-name "$STACK_NAME"
  echo "Waiting for CloudFormation stack deletion..."
  aws cloudformation wait stack-delete-complete --stack-name "$STACK_NAME"
else
  echo "No CloudFormation template found, skipping CloudFormation."
fi

echo "Teardown complete."