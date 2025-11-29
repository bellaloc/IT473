const express = require('express');
const cors = require('cors');

const app = express();
app.use(cors({ origin: 'http://localhost:3006' }));
app.use(express.json());

app.get('/notifications', (req, res) => {
  res.json([{ id: 1, message: "Your order is ready!" }]);
});

const PORT = process.env.NOTIFICATION_SERVICE_PORT || 3003;
app.listen(PORT, () => console.log(`Notification Service running on ${PORT}`));
