#!/bin/bash

echo "Installing dependencies for all CloudEats services..."

BASE_DIR=$(pwd)

SERVICES_DIR="$BASE_DIR/../services"
FRONTEND_DIR="$BASE_DIR/frontend"

SERVICES=("fleet-service" "inventory-service" "notification-service" "order-service" "payment-service")

# Install for each microservice
for SERVICE in "${SERVICES[@]}"; do
    SERVICE_PATH="$SERVICES_DIR/$SERVICE"
    if [ -d "$SERVICE_PATH" ]; then
        echo "Installing for $SERVICE..."
        cd "$SERVICE_PATH" || exit
        npm install
    else
        echo "WARNING: $SERVICE_PATH not found"
    fi
done

# Install frontend dependencies
if [ -d "$FRONTEND_DIR" ]; then
    echo "Installing frontend dependencies..."
    cd "$FRONTEND_DIR" || exit
    npm install
else
    echo "WARNING: Frontend folder not found at $FRONTEND_DIR"
fi

echo "✔ All installations completed!"
