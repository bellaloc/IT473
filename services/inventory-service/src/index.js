// inventory-service/src/index.js
const express = require('express');
const routes = require('./routes'); // import routes
const app = express();

app.use(express.json());
app.use('/api', routes); // Mount routes at /api

const PORT = process.env.PORT || 3002;
app.listen(PORT, () => {
  console.log(`Inventory Service running on port ${PORT}`);
});
