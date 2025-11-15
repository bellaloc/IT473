const express = require('express');
const app = express();
const port = process.env.PORT || 3002;

app.get('/', (req, res) => res.send('fleet Service Running'));

app.listen(port, () => console.log('fleet Service listening on port ' + port));
