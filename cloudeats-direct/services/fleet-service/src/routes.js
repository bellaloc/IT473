const express = require('express');
const router = express.Router();

router.get('/', (req, res) => {
  res.json({ message: 'Fleet service operational' });
});

router.get('/vehicles', (req, res) => {
  res.json({
    vehicles: [
      { id: 1, type: 'scooter', status: 'active' },
      { id: 2, type: 'car', status: 'maintenance' }
    ]
  });
});

module.exports = router;
