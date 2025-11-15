const express = require('express');
const router = express.Router();

router.get('/', (req, res) => {
  res.json({ message: "List of orders (placeholder)" });
});

router.post('/', (req, res) => {
  res.json({ message: "Create order (placeholder)" });
});

module.exports = router;
