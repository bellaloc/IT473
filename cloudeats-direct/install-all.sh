#!/bin/bash

echo "Installing dependencies for all CloudEats services..."

BASE_DIR="$(cd "$(dirname "$0")"; pwd)"
SERVICES_DIR="$BASE_DIR/services"
FRONTEND_DIR="$BASE_DIR/frontend"

SERVICES=("fleet-service" "inventory-service" "notification-service" "order-service" "payment-service")

for service in "${SERVICES[@]}"; do
    echo "Installing dependencies for $service..."
    cd "$SERVICES_DIR/$service" || { echo "Directory $service not found!"; continue; }
    npm install
done

echo "Installing dependencies for frontend..."
cd "$FRONTEND_DIR" || { echo "Frontend directory not found!"; exit 1; }
npm install

echo "✔ All installations completed!"
