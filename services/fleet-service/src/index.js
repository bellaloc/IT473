const express = require('express');
const cors = require('cors');

const app = express();
app.use(cors({ origin: 'http://localhost:3006' }));
app.use(express.json());

app.get('/drivers', (req, res) => {
  res.json([{ id: 1, name: "Driver A", status: "On duty" }]);
});

const PORT = process.env.FLEET_SERVICE_PORT || 3001;
app.listen(PORT, () => console.log(`Fleet Service running on ${PORT}`));
