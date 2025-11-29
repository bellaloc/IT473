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
