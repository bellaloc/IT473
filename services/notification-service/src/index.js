const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.json({ message: 'Notification service operational' });
});

const PORT = process.env.NOTIFICATION_SERVICE_PORT || 3003;
app.listen(PORT, () => {
  console.log(`Notification Service running on port ${PORT}`);
});
