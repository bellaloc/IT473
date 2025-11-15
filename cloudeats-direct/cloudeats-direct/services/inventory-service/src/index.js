const express = require('express');
const app = express();
const port = process.env.PORT || 3002;

app.get('/', (req, res) => res.send('inventory Service Running'));

app.listen(port, () => console.log('inventory Service listening on port ' + port));
