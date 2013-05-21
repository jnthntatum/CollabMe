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
	this.addUser = function (uid){
		if (this.users.indexOf(uid) == -1){
			users.push(uid);
			return true
		} else{
			return false;
		}
	}
	this.removeUser = function (uid){
		var idx = this.users.indexOf(uid); 
		if ( idx == -1){
			return false;
		} else{
			this.users.splice(idx, 1); 
			return true;
		}
	}
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
	this.hasUser = function(uid){
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

function sendAck(client, message){
	var m = new Message("ACK", 0);
	m.ack = message; 
	sendMessage(client, m); 
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

function procAck(client, message){

}

function validSid(message){
	return (typeof message.sid === 'number' && message.sid <= sessions.length && message.sid >= 0)
}

function procMessage(client, message){
	if (!validateMessage(message)){
		sendError(client, message, "malformed message header"); 
		return;
	}
	var command = message.command;
	var uid = message.uid; 
	if (command === "STATUS"){
		users.put(uid, client.id);
		sendAck(client, message); 
		//todo: logic for statuses other than here and away

	} else if(command === "CREATE"){
		var s = new session;
		s.users.addUser(uid);
		if (typeof message.uids === "object" && message.uids instanceof Array){
			for (var i = 0; i< message.uids.length ; i++){
				s.addUser(message.uids[i])
			}
			sendAck(client, message);		
		}
		var m = new Message("ACK", 0)
		m.sid = sessions.length;
		m.ack = message; 
		sendMessage(client, m);  
		sessions.push(s); 
	} else if(command === "LEAVE"){
		if (validSid(message)){
			var s = sessions[message.sid]; 
			if (s.removeUser(uid)){
				sendAck(client, message); 
			}else{
				sendError(client, message, "user not in session")
			}
		}else{
			sendError(client, message, "not a valid sid")
		}
	} else if(command === "ADD"){
		if (validSid(message)){
			var s = sessions[message.sid]; 
			if (s.addUser(uid)){
				sendAck(client, message); 
			}else{
				sendError(client, message, "user could not be added to session")
			}
		}else{
			sendError(client, message, "not a valid sid")
		}
	} else if(command === "POST"){
		if(!validSid(message)){
			sendError(client, message, "invalid sid") 
		}
		if (!(typeof message.data === 'object')){
			sendError(client, message, "no data supplied"); 
		}
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
