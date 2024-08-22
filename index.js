const express = require('express');
const app = express();
const os = require('os');
const hostname = os.hostname();
const version = 'v3.0.0';
const datetime = new Date();

app.get('/', (req, res) => {
  res.send(
    `Hello, World!</br>Version: ${version}</br>Hostname: ${hostname}</br>Time: ${datetime.toISOString()}`
  );
});

app.get('/health', (req, res) => {
  res.sendStatus(200);
});

app.get('/healthz', (req, res) => {
  res.sendStatus(200);
});

const PORT = process.env.PORT || 8080;
app.listen(PORT, () => {
  console.log(`Server listening on port ${PORT}`);
});
