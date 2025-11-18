#!/bin/bash

# Load environment variables
export $(grep -v '^#' .env | xargs)

# Check Docker
docker info >/dev/null 2>&1
DOCKER_RUNNING=$?

if [ $DOCKER_RUNNING -eq 0 ]; then
    echo "Docker is running. Building and starting all services..."
    docker compose up --build -d
    echo "All services started in Docker containers."
else
    echo "Docker is not running. Starting services locally with npm..."
    SERVICES=("fleet-service" "inventory-service" "notification-service" "order-service" "payment-service" "frontend")
    for SERVICE in "${SERVICES[@]}"; do
        echo "Starting $SERVICE..."
        cd "./services/$SERVICE" || [ "$SERVICE" == "frontend" ] && cd "./cloudeats-direct/frontend" || exit
        npm install
        npm start &
        cd - >/dev/null || exit
    done
fi

# Wait a few seconds for services to boot
sleep 5

echo ""
echo "✅ All services should now be running. Open your browser to:"
echo "Frontend: http://localhost:${FRONTEND_PORT}"
echo "Fleet: http://localhost:${FLEET_SERVICE_PORT}"
echo "Inventory: http://localhost:${INVENTORY_SERVICE_PORT}"
echo "Notification: http://localhost:${NOTIFICATION_SERVICE_PORT}"
echo "Order: http://localhost:${ORDER_SERVICE_PORT}"
echo "Payment: http://localhost:${PAYMENT_SERVICE_PORT}"
