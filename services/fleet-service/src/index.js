const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.json({ message: 'Fleet service operational' });
});

const PORT = process.env.PORT || 3001;
app.listen(PORT, () => {
  console.log(`Fleet Service running on port ${PORT}`);
});
