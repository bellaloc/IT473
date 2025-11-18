#!/bin/bash

# Exit on error
set -e

echo "Starting all services..."

for service in services/*-service; do
  echo ""
  echo "Checking $service ..."

  # Fix missing package.json if needed
  if [ ! -f "$service/package.json" ]; then
    echo "No package.json found in $service, creating one..."
    cat > "$service/package.json" <<EOL
{
  "name": "$(basename $service)",
  "version": "1.0.0",
  "description": "",
  "main": "src/index.js",
  "scripts": {
    "start": "node src/index.js",
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "",
  "license": "ISC",
  "dependencies": {}
}
EOL
  fi

  # Ensure dependencies are installed
  echo "Installing dependencies in $service..."
  (cd "$service" && npm install)

  # Check if src/index.js exists
  if [ ! -f "$service/src/index.js" ]; then
    echo "ERROR: src/index.js not found in $service. Please create the file."
    continue
  fi

  # Start the service
  echo "Starting $service ..."
  (cd "$service" && npm run start &)
done

echo ""
echo "All services are starting in the background."
echo "Use 'ps aux | grep node' to check running services."
