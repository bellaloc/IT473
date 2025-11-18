const express = require('express');
const cors = require('cors');

const app = express();

// Enable CORS for frontend
app.use(cors({
  origin: 'http://localhost:3006'
}));

// Parse JSON bodies
app.use(express.json());

// Test route
app.get('/', (req, res) => {
  res.json({ message: 'Inventory service operational' });
});

// Example products route
app.get('/api/products', (req, res) => {
  res.json([
    { id: 1, name: 'Product A', price: 10.99 },
    { id: 2, name: 'Product B', price: 15.99 },
    { id: 3, name: 'Product C', price: 7.99 }
  ]);
});

const PORT = process.env.INVENTORY_SERVICE_PORT || 3002;
app.listen(PORT, () => {
  console.log(`Inventory Service running on port ${PORT}`);
});
