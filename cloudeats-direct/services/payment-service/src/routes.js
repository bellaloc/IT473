const express = require('express');
const router = express.Router();

router.post('/charge', (req, res) => {
  const payment = req.body;
  res.json({
    message: 'Payment processed successfully',
    payment
  });
});

router.get('/', (req, res) => {
  res.json({ message: 'Payment service operational' });
});

module.exports = router;
