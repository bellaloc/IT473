#!/bin/bash
# setup_cloudeats_full.sh
# Creates CloudEats project structure, starter code, README, and package.json for each service

echo "Creating CloudEats project structure..."

# Root project folder
mkdir -p CloudEats
cd CloudEats || exit

# Services array
services=("order-service" "inventory-service" "fleet-service" "payment-service" "notification-service")

# Loop through each service
for service in "${services[@]}"
do
  echo "Setting up $service..."
  mkdir -p "$service"
  
  # Create index.js
  cat > "$service/index.js" << EOF
// $service - Starter code
const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.use(express.json());

app.get('/', (req, res) => {
  res.send('$service is running!');
});

app.listen(port, () => {
  console.log('$service listening on port', port);
});
EOF

  # Create package.json
  cat > "$service/package.json" << EOF
{
  "name": "$service",
  "version": "1.0.0",
  "description": "CloudEats microservice - $service",
  "main": "index.js",
  "scripts": {
    "start": "node index.js"
  },
  "dependencies": {
    "express": "^4.18.2"
  }
}
EOF

  # Create README.md
  cat > "$service/README.md" << EOF
# $service

This is the $service microservice for the CloudEats platform.

## Installation

\`\`\`bash
npm install
\`\`\`

## Running the service

\`\`\`bash
npm start
\`\`\`

The service will run on \`http://localhost:3000\` by default.
EOF

done

echo "CloudEats project setup complete!"
echo "You can now run 'npm install' in each microservice folder and start them with 'npm start'."

