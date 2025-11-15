const express = require('express');
const app = express();
const port = process.env.PORT || 3001;

app.get('/', (req, res) => res.send('Order Service Running'));

app.listen(port, () => console.log(`Order Service listening on port ${port}`));
