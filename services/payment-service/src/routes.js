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
