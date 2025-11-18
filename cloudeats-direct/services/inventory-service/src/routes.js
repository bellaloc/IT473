const express = require('express');
const router = express.Router();

router.get('/', (req, res) => {
  res.json({ message: 'Inventory service operational' });
});

router.get('/items', (req, res) => {
  res.json({
    inventory: [
      { id: 1, item: 'Chicken Bowl', stock: 20 },
      { id: 2, item: 'Vegan Wrap', stock: 15 }
    ]
  });
});

module.exports = router;
