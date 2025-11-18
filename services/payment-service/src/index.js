const express = require('express');
const routes = require('./routes');
const app = express();

app.use(express.json());
app.use('/payments', routes);

const PORT = process.env.PORT || 3005;
app.listen(PORT, () => {
  console.log(`Payment Service running on port ${PORT}`);
});
