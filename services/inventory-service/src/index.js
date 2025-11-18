const express = require('express');
const app = express();
app.use(express.json());

// Use the port from environment
const PORT = process.env.PORT || 3002;

// Routes
app.get('/api/products', (req, res) => {
  res.json({
    message: 'Inventory service operational',
    products: [
      { id: 1, name: 'Pizza', price: 12.99 },
      { id: 2, name: 'Burger', price: 9.99 },
      { id: 3, name: 'Sushi', price: 15.5 },
    ],
  });
});

// Health check
app.get('/', (req, res) => {
  res.json({ message: 'Inventory service running' });
});

app.listen(PORT, () => {
  console.log(`Inventory Service running on port ${PORT}`);
});
