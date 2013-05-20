/**
* wbserver.js
* 
*/ 

var primatives = require('./wbprimatives'); 

// code from davidwalsh.name/websocket 

// Require HTTP module (to start server) and Socket.IO
var http = require('http'), si = require('socket.io');

// Start the server at port 8080
var server = http.createServer(function(req, res){ 

	// Send HTML headers and message
	res.writeHead(200,{ 'Content-Type': 'text/html' }); 
	res.end('<h1>Hello Socket Lover!</h1>');
});
server.listen(8989);

// Create a Socket.IO instance, passing it our server
var io = si.listen(server);

function Session(){
	this.users = []
	this.drawables = []
	this.messages = []
}

var sessions = []; 

function UserMap(){
	this.userToClient = {}
	this.clientToUser = {}
	this.getUser = function(client){
		return this.clientToUser[client]  
	}
	this.getClient= function(uid){
		return this.userToClient[uid]
	}
	this.put = function(uid, client){
		if (uid in this.userToClient){
			return false;
		} else {
			this.userToClient[uid] = client;
			this.clientToUser[client] = uid;
		}
	}
	this.remove = function (uid){

		if (uid in this.userToClient){
			var cli = this.userToClient[uid];
			delete this.userToClient[uid] 
			delete this.clientToUser[cli]
			return true;
		}else{
			return false; 
		}
	}
	this.userIn(uid){
		return uid in this.userToClient; 
	}
}

var users = new UserMap();  

function Message(command, uid){
	this.message = command;
	this.uid = uid; 
}

function sendError(client, message, error){
	var m = new Message("ERROR", 0) 
	m.cause = message; 
	m.details =  error;  
	sendMessage(client, m) 
}

function sendMessage(client, message){
	console.log("send message to" + client.id + ": " + message.command)
}

function validateMessage(message){
	if (typeof message.uid === 'number' && message.uid > 0 &&
	 	typeof message.command === 'string'){
		return true;
	}else 
		return false; 
}

function procMessage(client, message){
	if (!validateMessage(message)){
		sendError(client, message, "malformed message header"); 
	}
	var command = message.command;
	var uid = message.uid; 
	if (command === "STATUS"){
		sessions.push(uid);  
		users.put(uid, client.id);
		if (typeof message.uids ==='object' && message.uids instanceof Array)
			for (var i = 0; i < message.uids.length; i++){
				if (users.hasUser(uid))
					sessions.push(uid)
			} 
		var m = new Message("ACK", );
	} else if(command === "CREATE"){

	} else if(command === "LEAVE"){
		
	} else if(command === "ADD"){
		
	} else if(command === "POST"){
		
	} else if(command === "CREATE"){
		
	} else {
		sendError(client, message, "unrecognized command")
	}
}

// Add a connect listener
io.sockets.on('connection', function(client){ 
	
	// Success!  Now listen to messages to be received
	client.on('message',function(event){ 
		procMessage(client, event)
	});

	client.on('disconnect',function(){
		console.log('Server has disconnected from client', client);
	});

});