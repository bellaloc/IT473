const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.json({ message: 'Inventory service operational' });
});

const PORT = process.env.PORT || 3002;
app.listen(PORT, () => {
  console.log(`Inventory Service running on port ${PORT}`);
});
