// fleet-service - Starter code
const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.use(express.json());

app.get('/', (req, res) => {
  res.send('fleet-service is running!');
});

app.listen(port, () => {
  console.log('fleet-service listening on port', port);
});
