const express = require('express');
const router = express.Router();

// Basic operational check
router.get('/', (req, res) => {
  res.json({ message: 'Order service operational' });
});

// List orders (placeholder)
router.get('/list', (req, res) => {
  res.json({ message: 'List of orders (placeholder)' });
});

// Create order
router.post('/create', (req, res) => {
  const order = req.body;
  res.json({
    message: 'Order created successfully',
    order
  });
});

module.exports = router;
