#!/bin/bash

# Check if Docker is running
docker info >/dev/null 2>&1
DOCKER_RUNNING=$?

SERVICES=("fleet-service" "inventory-service" "notification-service" "order-service" "payment-service")

if [ $DOCKER_RUNNING -eq 0 ]; then
    echo "Docker is running. Building and starting all services with Docker Compose..."
    cd "$(dirname "$0")"
    docker compose up --build -d
    echo "All services are starting in Docker containers."
    echo "Use 'docker ps' to see running containers."
else
    echo "Docker is not running. Starting services locally..."
    for SERVICE in "${SERVICES[@]}"; do
        echo "Starting $SERVICE..."
        cd "./cloudeats-direct/services/$SERVICE" || exit
        npm install
        npm start &
        cd - >/dev/null || exit
    done

    echo "Starting frontend..."
    cd "./cloudeats-direct/frontend" || exit
    npm install
    npm start &
    cd - >/dev/null || exit

    echo "All services started locally in the background."
fi
