const express = require('express');

const app = express();
app.use(express.static(__dirname));

app.listen(3000, function() {
  const port = 3000
  console.log(`Started on http://0.0.0.0:${port}/`);
});
