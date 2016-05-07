var express = require('express');
var winston = require('winston');
var expressWinston = require('express-winston');
var connect = require('connect');
var app = express();
app.use(expressWinston.logger({
      transports: [
        new winston.transports.Console({
          json: true,
          colorize: true
        })
      ],
      meta: true,
      msg: "HTTP {{req.method}} {{req.url}}",
      expressFormat: true,
      colorStatus: true,
      ignoreRoute: function (req, res) { return false; }
    }));
app.use(express.static(__dirname + '/public'));
app.listen(5050, function() {
  console.log('Listening in on port 5050');
});
