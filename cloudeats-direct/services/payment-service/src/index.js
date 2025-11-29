const express = require('express');
const cors = require('cors');

const app = express();

app.use(cors({ origin: 'http://localhost:3006' }));
app.use(express.json());

// Example payment endpoint
app.get('/payments', (req, res) => {
  res.json([{ id: 1, method: "card", status: "approved" }]);
});

const PORT = process.env.PAYMENT_SERVICE_PORT || 3005;
app.listen(PORT, () => {
  console.log(`Payment Service running on port ${PORT}`);
});
