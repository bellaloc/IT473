const express = require('express');
const cors = require('cors');

const app = express();
app.use(cors({ origin: 'http://localhost:3006' }));
app.use(express.json());

// Correct route
app.get('/api/products', (req, res) => {
  res.json([
    { id: 1, name: "Burger", price: 10 },
    { id: 2, name: "Fries", price: 5 },
    { id: 3, name: "Soda", price: 3 }
  ]);
});

const PORT = process.env.INVENTORY_SERVICE_PORT || 3002;
app.listen(PORT, () => console.log(`Inventory Service running on ${PORT}`));
