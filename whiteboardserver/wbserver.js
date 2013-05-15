/**
* wbserver.js
* 
*/ 

var primatives = require('./wbprimatives'); 

var net = require('net');

function procAction(){

}

var server = net.createServer(function (socket) {
  socket.write('WBServer Connected\r\n');
  socket.write('Creates')

});

server.listen(8989);