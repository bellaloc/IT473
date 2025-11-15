
#!/bin/bash

# Root project folder
PROJECT="cloudeats-direct"
mkdir -p $PROJECT
cd $PROJECT

# Create folder structure
mkdir -p services/order-service/src
mkdir -p services/inventory-service/src
mkdir -p services/fleet-service/src
mkdir -p services/payment-service/src
mkdir -p services/notification-service/src
mkdir -p infrastructure/network
mkdir -p infrastructure/compute
mkdir -p infrastructure/database
mkdir -p infrastructure/storage
mkdir -p ci-cd/github-actions
mkdir -p ci-cd/scripts
mkdir -p docs

# Create service starter files with basic code
cat << EOF > services/order-service/src/index.js
const express = require('express');
const app = express();
const port = process.env.PORT || 3001;

app.get('/', (req, res) => res.send('Order Service Running'));

app.listen(port, () => console.log(\`Order Service listening on port \${port}\`));
EOF

cat << EOF > services/order-service/src/routes.js
// Define order service routes here
module.exports = {};
EOF

cat << EOF > services/order-service/src/db.js
// Database connection setup for Order Service
module.exports = {};
EOF

# Repeat for other microservices with minimal starter code
for svc in inventory fleet payment notification; do
mkdir -p services/$svc-service/src
cat << EOF > services/$svc-service/src/index.js
const express = require('express');
const app = express();
const port = process.env.PORT || 3002;

app.get('/', (req, res) => res.send('$svc Service Running'));

app.listen(port, () => console.log('$svc Service listening on port ' + port));
EOF
done

# Infrastructure placeholder files
touch infrastructure/network/{main.tf,variables.tf,outputs.tf}
touch infrastructure/compute/{main.tf,variables.tf,outputs.tf}
touch infrastructure/database/{main.tf,variables.tf,outputs.tf}
touch infrastructure/storage/{main.tf,variables.tf,outputs.tf}

# CI/CD scripts
cat << EOF > ci-cd/scripts/build.sh
#!/bin/bash
echo "Building project..."
EOF

cat << EOF > ci-cd/scripts/deploy.sh
#!/bin/bash
echo "Deploying project..."
EOF

cat << EOF > ci-cd/scripts/test.sh
#!/bin/bash
echo "Running tests..."
EOF

# GitHub Actions workflow placeholder
cat << EOF > ci-cd/github-actions/build-and-deploy.yml
name: Build and Deploy

on:
  push:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Echo Build
        run: echo "Build Step"
EOF

# Documentation placeholders
touch docs/architecture-diagram.png
touch docs/api-spec.yaml
touch docs/team-roles.md

echo "Project structure and starter files created successfully!"


