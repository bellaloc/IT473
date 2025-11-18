#!/bin/bash

# 1️⃣ Delete old project folder
echo "Deleting old cloudeats-direct folder..."
sudo rm -rf ~/IT473/cloudeats-direct
mkdir -p ~/IT473/cloudeats-direct
cd ~/IT473/cloudeats-direct || exit

# 2️⃣ Create folder structure
echo "Creating folder structure..."
mkdir -p ci-cd/github-actions ci-cd/scripts
mkdir -p services/fleet-service/src
mkdir -p services/inventory-service/src
mkdir -p services/notification-service/src
mkdir -p services/order-service/src
mkdir -p services/payment-service/src
mkdir -p infrastructure/{compute,database,network,security,storage,monitoring,integration,global}
mkdir -p docs

# 3️⃣ Add starter files for CI/CD
echo "Creating CI/CD starter files..."
cat > ci-cd/github-actions/build-and-deploy.yml <<EOL
# Starter GitHub Actions YAML
name: Build and Deploy
on: [push]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
EOL

cat > ci-cd/scripts/build.sh <<EOL
#!/bin/bash
echo "Building services..."
EOL

cat > ci-cd/scripts/deploy.sh <<EOL
#!/bin/bash
echo "Deploying services..."
EOL

cat > ci-cd/scripts/test.sh <<EOL
#!/bin/bash
echo "Testing services..."
EOL

# 4️⃣ Add starter README
cat > README.md <<EOL
# CloudEats Project
Microservices architecture project for CloudEats.
EOL

# 5️⃣ Add basic package.json and index.js for each service
services=("fleet-service" "inventory-service" "notification-service" "order-service" "payment-service")
for service in "${services[@]}"; do
  mkdir -p "services/
