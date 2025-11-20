// inventory-service/src/routes.js
const express = require('express');
const router = express.Router();

// Sample product data
const products = [
  { id: 1, name: "Burger", description: "Juicy beef burger", price: 8.99 },
  { id: 2, name: "Pizza", description: "Cheesy pizza slice", price: 12.99 },
  { id: 3, name: "Salad", description: "Fresh garden salad", price: 6.5 },
];

// GET /api/products
router.get('/products', (req, res) => {
  res.json(products);
});

module.exports = router;
