#!/usr/bin/env bash
set -e

# ----------------------------------------
# Load environment variables if .env exists
# ----------------------------------------
if [ -f ".env" ]; then
  export $(grep -v '^#' .env | xargs)
fi

echo "Checking Docker status..."

# ----------------------------------------
# Check if Docker is running
# ----------------------------------------
if docker info >/dev/null 2>&1; then
  echo "Docker is running. Starting all services with Docker Compose..."
  docker compose up --build -d
  echo "✅ All services started in Docker containers."

else
  echo "⚠ Docker is NOT running. Starting services locally using npm..."

  # ----------------------------------------
  # Backend services
  # ----------------------------------------
  SERVICES=(
    "fleet-service"
    "inventory-service"
    "notification-service"
    "order-service"
    "payment-service"
  )

  for SERVICE in "${SERVICES[@]}"; do
    SERVICE_PATH="./services/$SERVICE"

    echo ""
    echo "Starting $SERVICE..."

    if [ ! -d "$SERVICE_PATH" ]; then
      echo "❌ ERROR: Directory not found: $SERVICE_PATH"
      continue
    fi

    (
      cd "$SERVICE_PATH"

      if [ ! -d "node_modules" ]; then
        echo "Installing dependencies for $SERVICE..."
        npm install
      fi

      echo "Launching $SERVICE..."
      npm start
    ) &
  done

  # ----------------------------------------
  # Frontend
  # ----------------------------------------
  echo ""
  echo "Starting frontend..."

  FRONTEND_PATH="./frontend"

  if [ ! -d "$FRONTEND_PATH" ]; then
    echo "❌ ERROR: Frontend folder not found: $FRONTEND_PATH"
    exit 1
  fi

  (
    cd "$FRONTEND_PATH"

    if [ ! -d "node_modules" ]; then
      echo "Installing frontend dependencies..."
      npm install
    fi

    echo "Launching frontend..."
    BROWSERSLIST_IGNORE_OLD_DATA=true npm start
  ) &
fi

# ----------------------------------------
# Output service URLs
# ----------------------------------------
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
