const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('fleet-service is running!');
});

app.listen(port, () => {
  console.log('fleet-service listening on port ' + port);
});
