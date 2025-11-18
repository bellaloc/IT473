require('dotenv').config();
const express = require('express');
const routes = require('./routes');

const app = express();
app.use(express.json());

app.use('/fleet', routes);

const PORT = process.env.PORT;
app.listen(PORT, () => {
  console.log(`Fleet Service running on port ${PORT}`);
});
