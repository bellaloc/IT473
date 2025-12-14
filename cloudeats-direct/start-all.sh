#!/bin/bash

echo "Checking Docker status..."
docker info > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Docker is not running. Please start Docker Desktop first."
    exit 1
fi

echo "Starting all services with Docker Compose..."
cd "$(dirname "$0")" || exit

# Use modern Docker Compose
docker compose -f docker-compose.yml up -d --build

echo "--------------------------------------------------"
echo "🚀 SERVICES ARE STARTING"
echo "--------------------------------------------------"
echo "Frontend:        http://localhost:3000"
echo "Fleet API:       http://localhost:3001"
echo "Inventory API:   http://localhost:3002"
echo "Notification:    http://localhost:3003"
echo "Order API:       http://localhost:3004"
echo "Payment API:     http://localhost:3005"
echo "--------------------------------------------------"
echo "🎉 ALL SERVICES SHOULD BE LIVE"
