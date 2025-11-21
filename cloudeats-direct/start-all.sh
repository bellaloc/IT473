#!/bin/bash

# Load .env if present
if [ -f ".env" ]; then
    export $(grep -v '^#' .env | xargs)
fi

echo "Checking Docker status..."

docker info >/dev/null 2>&1
DOCKER_RUNNING=$?

if [ $DOCKER_RUNNING -eq 0 ]; then
    echo "Docker running → starting Docker Compose..."
    docker compose up --build -d
    echo "✅ Services started in Docker containers."
else
    echo "⚠ Docker NOT running → starting services locally..."

    SERVICES=("fleet-service" "inventory-service" "notification-service" "order-service" "payment-service")
    SERVICES_DIR="./services"
    FRONTEND_DIR="./cloudeats-direct"

    for SERVICE in "${SERVICES[@]}"; do
        SERVICE_PATH="$SERVICES_DIR/$SERVICE"

        echo "Starting $SERVICE..."

        if [ ! -d "$SERVICE_PATH" ]; then
            echo "❌ ERROR: Missing directory: $SERVICE_PATH"
            exit 1
        fi

        cd "$SERVICE_PATH" || exit

        if [ ! -d "node_modules" ]; then
            echo "Installing dependencies for $SERVICE..."
            npm install
        fi

        npm start &
        cd - >/dev/null || exit
    done

    echo "Starting frontend..."

    if [ ! -d "$FRONTEND_DIR" ]; then
        echo "❌ ERROR: Frontend folder NOT found: $FRONTEND_DIR"
        exit 1
    fi

    cd "$FRONTEND_DIR" || exit

    if [ ! -d node_modules ]; then
        echo "Installing frontend dependencies..."
        npm install
    fi

    npm start &

    cd - >/dev/null || exit
fi

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
