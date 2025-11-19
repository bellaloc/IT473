const express = require('express');
const cors = require('cors');

const app = express();

app.use(cors({ origin: 'http://localhost:3006' }));
app.use(express.json());

// Example order route
app.get('/orders', (req, res) => {
  res.json([{ id: 1, item: "Burger", status: "received" }]);
});

const PORT = process.env.ORDER_SERVICE_PORT || 3004;
app.listen(PORT, () => {
  console.log(`Order Service running on port ${PORT}`);
});
