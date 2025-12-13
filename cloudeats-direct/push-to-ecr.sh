#!/bin/bash
set -e

# -----------------------------
# Push all CloudEats microservices to AWS ECR
# -----------------------------

# AWS ECR info
AWS_REGION="us-east-1"
AWS_ACCOUNT_ID="431136220866"

# Microservices list
MICROSERVICES=("fleet-service" "inventory-service" "notification-service" "order-service" "payment-service")

# Login to ECR
echo "Logging in to AWS ECR..."
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com
echo "✅ Logged in to ECR"

# Build, tag, and push each microservice
for SERVICE in "${MICROSERVICES[@]}"; do
  echo "----------------------------------------"
  echo "Building Docker image for $SERVICE..."
  docker build -t $SERVICE ./services/$SERVICE

  echo "Tagging image for ECR..."
  docker tag $SERVICE:latest $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$SERVICE:latest

  echo "Pushing $SERVICE to ECR..."
  docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$SERVICE:latest

  echo "✅ $SERVICE pushed successfully!"
done

echo "----------------------------------------"
echo "All microservices have been built and pushed to ECR!"
