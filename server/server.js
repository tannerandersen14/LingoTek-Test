var express = require('express'),
  winston = require('winston'),
  expressWinston = require('express-winston'),
  connect = require('connect'),
  app = express();




app.listen(5050, function() {
  console.log('Listening in on port 5050');
});
