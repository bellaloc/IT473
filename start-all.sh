#!/bin/bash

echo "Installing dependencies for all services..."

for service in cloudeats-direct/CloudEats/*-service; do
  if [ -d "$service" ]; then
    echo "Installing in $service..."
    pushd "$service" > /dev/null
    npm install
    popd > /dev/null
  fi
done

echo "Starting all services..."
for service in cloudeats-direct/CloudEats/*-service; do
  if [ -d "$service" ]; then
    echo "Starting $service..."
    pushd "$service" > /dev/null
    npm start &
    popd > /dev/null
  fi
done

wait
