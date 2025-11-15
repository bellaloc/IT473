const express = require('express');
const routes = require('./routes');

const app = express();
app.use(express.json());

app.use('/orders', routes);

const PORT = process.env.PORT || 3001;
app.listen(PORT, () => {
  console.log(`Order Service running on port ${PORT}`);
});
