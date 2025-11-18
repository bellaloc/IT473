#!/bin/bash

echo "Cleaning old/messy folders..."
rm -rf CloudEats
rm -rf cloudeats-direct/CloudEats
rm -rf services/*/*/*

echo "Recreating clean services structure..."
mkdir -p services/fleet-service/src
mkdir -p services/inventory-service/src
mkdir -p services/notification-service/src
mkdir -p services/order-service/src
mkdir -p services/payment-service/src

echo "Writing index.js files..."

# Fleet Service
cat > services/fleet-service/src/index.js <<EOF
const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.json({ message: 'Fleet service operational' });
});

const PORT = process.env.PORT || 3001;
app.listen(PORT, () => {
  console.log(\`Fleet Service running on port \${PORT}\`);
});
EOF

# Inventory Service
cat > services/inventory-service/src/index.js <<EOF
const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.json({ message: 'Inventory service operational' });
});

const PORT = process.env.PORT || 3002;
app.listen(PORT, () => {
  console.log(\`Inventory Service running on port \${PORT}\`);
});
EOF

# Notification Service
cat > services/notification-service/src/index.js <<EOF
const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.json({ message: 'Notification service operational' });
});

const PORT = process.env.PORT || 3003;
app.listen(PORT, () => {
  console.log(\`Notification Service running on port \${PORT}\`);
});
EOF

# Order Service
cat > services/order-service/src/index.js <<EOF
const express = require('express');
const routes = require('./routes');
const app = express();

app.use(express.json());
app.use('/orders', routes);

const PORT = process.env.PORT || 3004;
app.listen(PORT, () => {
  console.log(\`Order Service running on port \${PORT}\`);
});
EOF

cat > services/order-service/src/routes.js <<EOF
const express = require('express');
const router = express.Router();

router.get('/', (req, res) => {
  res.json({ message: 'List of orders (placeholder)' });
});

router.post('/', (req, res) => {
  const order = req.body;
  res.json({ message: 'Order created successfully', order });
});

module.exports = router;
EOF

# Payment Service
cat > services/payment-service/src/index.js <<EOF
const express = require('express');
const routes = require('./routes');
const app = express();

app.use(express.json());
app.use('/payments', routes);

const PORT = process.env.PORT || 3005;
app.listen(PORT, () => {
  console.log(\`Payment Service running on port \${PORT}\`);
});
EOF

cat > services/payment-service/src/routes.js <<EOF
const express = require('express');
const router = express.Router();

router.get('/', (req, res) => {
  res.json({ message: 'Payment service operational' });
});

router.post('/', (req, res) => {
  const payment = req.body;
  res.json({ message: 'Payment processed successfully', payment });
});

module.exports = router;
EOF

echo "All services cleaned, recreated, and index.js files written!"
