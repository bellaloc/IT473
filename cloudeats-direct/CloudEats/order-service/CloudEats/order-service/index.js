const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('order-service is running!');
});

app.listen(port, () => {
  console.log('order-service listening on port ' + port);
});
