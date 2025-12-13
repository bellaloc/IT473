#!/usr/bin/env bash
set -euo pipefail

# --- CONFIG ---
AWS_REGION="us-east-1"
AWS_ACCOUNT_ID="431136220866"
ECR_URL="$AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com"

SERVICES=(
  "fleet-service"
  "inventory-service"
  "notification-service"
  "order-service"
  "payment-service"
)

# Ensure Docker is running and AWS CLI is configured
echo "Checking Docker..."
if ! docker info >/dev/null 2>&1; then
  echo "ERROR: Docker doesn't appear to be running. Start Docker Desktop and re-run." >&2
  exit 2
fi

echo "Logging into ECR ($ECR_URL)..."
aws ecr get-login-password --region "$AWS_REGION" | docker login --username AWS --password-stdin "$ECR_URL"

for SERVICE in "${SERVICES[@]}"; do
  SERVICE_DIR="services/$SERVICE"
  if [ ! -d "$SERVICE_DIR" ]; then
    echo "WARN: service directory not found: $SERVICE_DIR - skipping" >&2
    continue
  fi

  echo
  echo "======================================"
  echo "Building image for $SERVICE"
  echo "Context: $SERVICE_DIR"
  docker build -t "$SERVICE:latest" "$SERVICE_DIR"

  IMAGE_TAG="$ECR_URL/$SERVICE:latest"
  echo "Tagging $SERVICE -> $IMAGE_TAG"
  docker tag "$SERVICE:latest" "$IMAGE_TAG"

  echo "Pushing $IMAGE_TAG"
  docker push "$IMAGE_TAG"

  echo "✅ Pushed $SERVICE -> $IMAGE_TAG"
done

echo
echo "All done. Verify images in ECR with: aws ecr list-images --repository-name <repo> --region $AWS_REGION"
