#!/bin/bash

# Check if Docker is running
docker info >/dev/null 2>&1
DOCKER_RUNNING=$?

SERVICES=("fleet-service" "inventory-service" "notification-service" "order-service" "payment-service")

if [ $DOCKER_RUNNING -eq 0 ]; then
    echo "Docker is running. Building and starting all services with Docker Compose..."
    
    # Move to project root where docker-compose.yml is
    cd "$(dirname "$0")"
    
    # Build and start all services
    docker compose up --build -d

    echo "All services are starting in Docker containers."
    echo "Use 'docker ps' to see running containers."
else
    echo "Docker is not running. Falling back to local npm start for each service..."
    
    for SERVICE in "${SERVICES[@]}"; do
        echo "Starting $SERVICE..."
        cd "../services/$SERVICE" || exit
        npm install
        # Start service in background
        npm start &
        cd - >/dev/null || exit
    done

    echo "All services are starting locally in the background."
    echo "Use 'ps aux | grep node' to see running services."
fi
