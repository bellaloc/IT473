#!/bin/bash

# Load environment variables safely
if [ -f ".env" ]; then
    export $(grep -v '^#' .env | xargs)
fi

echo "Checking Docker status..."

# Check if Docker is running
docker info >/dev/null 2>&1
DOCKER_RUNNING=$?

if [ $DOCKER_RUNNING -eq 0 ]; then
    echo "Docker is running. Building and starting all services with Docker Compose..."
    docker compose up --build -d
    echo "✅ All services started in Docker containers."
else
    echo "⚠ Docker is NOT running. Starting services locally using npm..."

    # Service list and paths (services are outside cloudeats-direct)
    SERVICES=(
        "fleet-service"
        "inventory-service"
        "notification-service"
        "order-service"
        "payment-service"
    )

    for SERVICE in "${SERVICES[@]}"; do
        SERVICE_PATH="../services/$SERVICE"

        echo ""
        echo "Starting $SERVICE..."

        if [ ! -d "$SERVICE_PATH" ]; then
            echo "❌ ERROR: Directory not found: $SERVICE_PATH"
            exit 1
        fi

        cd "$SERVICE_PATH" || exit

        # Install dependencies if missing
        if [ ! -d "node_modules" ]; then
            echo "Installing dependencies for $SERVICE..."
            npm install
        fi

        echo "Launching $SERVICE..."
        npm start &

        cd - >/dev/null || exit
    done

    echo ""
    echo "Starting frontend..."

    FRONTEND_PATH="./frontend"

    if [ ! -d "$FRONTEND_PATH" ]; then
        echo "❌ ERROR: Frontend folder not found: $FRONTEND_PATH"
        exit 1
    fi

    cd "$FRONTEND_PATH" || exit

    if [ ! -d "node_modules" ]; then
        echo "Installing frontend dependencies..."
        npm install
    fi

    echo "Launching frontend..."
    npm start &

    cd - >/dev/null || exit
fi

# Let services boot
sleep 5

echo ""
echo "--------------------------------------------------"
echo "🚀 SERVICES ARE STARTING"
echo "--------------------------------------------------"
echo "Frontend:        http://localhost:${FRONTEND_PORT:-3000}"
echo "Fleet API:       http://localhost:${FLEET_SERVICE_PORT:-3001}"
echo "Inventory API:   http://localhost:${INVENTORY_SERVICE_PORT:-3002}"
echo "Notification:    http://localhost:${NOTIFICATION_SERVICE_PORT:-3003}"
echo "Order API:       http://localhost:${ORDER_SERVICE_PORT:-3004}"
echo "Payment API:     http://localhost:${PAYMENT_SERVICE_PORT:-3005}"
echo "--------------------------------------------------"
echo "🎉 ALL SERVICES SHOULD BE LIVE"
echo ""
