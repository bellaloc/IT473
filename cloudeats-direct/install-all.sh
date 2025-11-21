#!/bin/bash

echo "Installing dependencies for all CloudEats services..."

BASE_DIR=$(pwd)

SERVICES_DIR="$BASE_DIR/services"
FRONTEND_DIR="$BASE_DIR/cloudeats-direct"

SERVICES=("fleet-service" "inventory-service" "notification-service" "order-service" "payment-service")

echo "Base directory: $BASE_DIR"
echo "Services directory: $SERVICES_DIR"
echo "Frontend directory: $FRONTEND_DIR"

# Install microservice dependencies
for SERVICE in "${SERVICES[@]}"; do
    SERVICE_PATH="$SERVICES_DIR/$SERVICE"
    if [ -d "$SERVICE_PATH" ]; then
        echo "Installing dependencies for $SERVICE..."
        cd "$SERVICE_PATH" || exit
        npm install
    else
        echo "WARNING: Missing microservice: $SERVICE_PATH"
    fi
done

# Install frontend
if [ -d "$FRONTEND_DIR" ]; then
    echo "Installing frontend dependencies..."
    cd "$FRONTEND_DIR" || exit
    npm install
else
    echo "WARNING: Frontend not found at: $FRONTEND_DIR"
fi

echo "✔ All installations completed!"
