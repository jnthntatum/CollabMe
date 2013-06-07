/**
* wbserver.js
* 
*/ 

var prim = require('./wbprimatives'); 

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

var FNs={}

function Session(){
	this.users = []
	this.drawables = []
	this.messages = []
	this.drawing = false; 
	this.addUser = function (uid){
		if (this.users.indexOf(uid) == -1){
			this.users.push(uid);
		}
		return true;
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
		this.userToClient[uid] = client;

		this.clientToUser[client] = uid;
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
	this.command = command;
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
	client.emit("message", message);
}

function validateMessage(message){
	if (typeof parseInt(message.uid) === 'number' && message.uid > 0 &&
	 	typeof message.command === 'string'){
		return true;
	}else 
		return false; 
}

function validSid(message){
	return (typeof message.sid === 'number' &&
	 	message.sid < sessions.length && message.sid >= 0 &&
	  	sessions[message.sid] != undefined)
}

function broadcast(session, message, source){
	for (var i = 0; i < session.users.length; i++){
		if (typeof source !== 'undefined' && session.users[i] === source)
			continue; 
		var c = users.getClient(session.users[i]);
		console.log("Trying to send to " + c);
		if (c){
			sendMessage(io.sockets.socket(c), message); 
		}
	}
}

function HandleAck(client, message, uid){
	//No op 
}

function HandleStatus(client, message, uid){
	if (!message.status){
			sendError(client, message, 'no status specified')
			return
		}
	if (message.status === 'ONLINE'){
		users.put(uid, client.id);
		sendAck(client, message); 
	} else if (message.status === 'OFFLINE'){
		users.remove(uid); 
	}
}

function HandleCreate(client, message, uid){
	var s = new Session();
	s.addUser(uid);
	if (typeof message.uids === "object" && message.uids instanceof Array){
		for (var i = 0; i< message.uids.length ; i++){
			s.addUser(message.uids[i])
		}	
	}

	message.sid=sessions.length; 
	
	message.sid = sessions.length;
	broadcast(s, message, uid);
	sendAck(client,message);  
	sessions.push(s); 
}

function HandleLeave(client, message, uid){
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
}
function HandleAdd(client, message, uid){
	if (!validSid(message)){
		sendError(client, message, "not a valid sid")
		return
	}
	var s = sessions[message.sid];
	var uids = message.uids; 
	if (typeof uids !== 'object' ||  !(uids instanceof Array) ){
		sendError(client, message, "uids array not valid");
		return;
	}
	var uids2 = []; 
	for (var i =0; i <uids.length; i ++){	
		if (s.addUser(uids[i])){
			uids2.push(uids[i]);  
		}
	}
	message.uids = uids2; 
	sendAck(client, message);
}

function HandlePost(client, message, uid){
	if(!validSid(message)){
		sendError(client, message, "invalid sid")
		return;  
	}
	if (!(typeof message.data === 'object') || message.data == null){
		sendError(client, message, "no data supplied");
		return; 
	}
	var parse = prim.parseJSON(message.data); 
	if (parse == null){
		sendError(client, message, "data type not recognized");
		return; 
	}
	var sid = message.sid; 
	var s = sessions[sid];
	if (message.idx && typeof message.idx === 'number'){
		var idx = message.idx; 
		if (idx < 0 || idx >= s.drawables.length){
			sendError(client, message, "not a valid index")
			return
		}

		if (parse.type==='chat_message')
			s.messages[idx] = parse
		else
			s.drawables[idx] = parse;
	} else {
		var idx; 
		if (parse.type === 'chat_message'){
			idx = s.messages.length;
			s.messages.push(parse);
		}else{
			idx = s.drawables.length;
			s.drawables.push(parse);
		}
		message.idx = idx;
	}
	broadcast(s, message, uid); 
	sendAck(client, message); 
}

function HandleDelete(client, message, uid){
	if(!validSid(message)){
		sendError(client, message, "not a valid session"); 
		return;  
	}
	if (!(typeof message.idx === 'number' && message.idx >= 0)){
		sendError(client, message, "invalid drawable index"); 
		return;
	}
	var idx = message.idx; 
	var sid = message.sid; 
	var s = sessions[sid];
	if (idx >= s.drawables.length){
		sendError(client, message, "invalid drawable index"); 
		return;
	}
	s.drawables[idx] = null; 
	broadcast(s, message, uid);
	sendAck(client, message);
}

function HandleErase(client, message, uid){
	if (!validSid(message)){
		sendError(client, message, "not a valid session");
		return;
	}
	var s = sessions[message.sid]; 
	s.drawbles = [];  
	broadcast(s, message, uid);
	sendAck(client, message);
}

function HandleHistory(client, message, uid){
	if(!validSid(message)){
		sendError(client, message, "not a valid session"); 
		return;  
	}
	if (typeof message.type !== 'string'){
		sendError(client, message, "no type specified")
		return; 
	}
	var type = message.type;
	var sid = message.sid; 
	var s = sessions[sid]; 
	if (type === "drawables"){
		message.drawables = s.drawables;
	} else if (type === "chat_messages"){
		message.chat_messages = s.messages; 
	}
	sendAck(client, message); 
}

function HandleGetStatus(client, message, uid){
	if( ! typeof message.uids === 'object' || ! message.uids instanceof Array){
		SendError(client, message, "invalid uid list"); 
		return; 
	}
	var reply = {}; 
	for (var i = 0 ; i < message.uids.length; i ++){
		var uid = message.uids[i]; 
		if (users.hasUser(uid))
			reply[uid] = 'ONLINE'
		else
			reply[uid] = 'OFFLINE'
	}
	message.uids = reply;
	sendAck(client, message);
}


function HandleFlatten(client, message, uid){
	if (!validSid(message)){
		sendError(client, message, 'Invalid sid');
		return;
	}
	var img = prim.parseJSON(message.img)
	if (!message.img || !img){
		sendError(client, message, 'No valid flattened image received');
		return;
	}
	var s = sessions[message.sid];
	if (!message.layers)
		message.layers = s.drawables.length; 

	broadcast(s, message, uid);
	sendAck(client, message);
	var tmp = [img]; 
	tmp.concat(s.drawables.slice(message.layers)) 
	s.drawables = tmp; 
}

function HandleRestore(client, message, uid){
	if(!validSid(message)){
		sendError(client, message, 'invalid sid')
		return; 
	}

	var s = sessions[message.sid]; 
	if (	typeof message.drawables !== 'object' || !(message.drawables instanceof Array)
		||	typeof message.messages !== 'object' || !(message.messages instanceof Array)
		){
		sendError(client, message, 'session data sent is invalid.')
		return; 
	}
	s.drawables = message.drawables;
	s.messages = message.messages;
	sendAck(client, message); 

}

function HandleWhoIs(client, message, uid){
	if(!validSid(message)){
		sendError(client, message, 'invalid sid')
		return; 
	}
	message.session = sessions[message.sid];
	sendAck(client, message); 
}

/*function HandleX(client, message, uid){

}*/

function SetUpEventHandles(){
	FNs["STATUS"] = HandleStatus;
	FNs["ACK"] = HandleAck; 
	FNs["CREATE"] = HandleCreate;
	FNs["LEAVE"] = HandleLeave;  
	FNs["ADD"] = HandleAdd; 
	FNs["POST"] = HandlePost; 
	FNs["DELETE"] = HandleDelete; 
	FNs["ERASE"] = HandleErase;
	FNs["GET_STATUS"] = HandleGetStatus;
	FNs["HISTORY"] = HandleHistory;
	FNs["FLATTEN"] = HandleFlatten;
	FNs["RESTORE"] = HandleRestore;  
	FNs["WHOIS"] = HandleWhoIs;
}

function procMessage(client, message){
	if (!validateMessage(message)){
		sendError(client, message, "malformed message header"); 
		return;
	}
	var command = message.command;
	var uid = message.uid; 
	if (command in FNs && typeof FNs[command] === 'function'){
		FNs[command](client, message, uid);	
	}
	else {
		sendError(client, message, "unrecognized command")
	}
}


SetUpEventHandles();

// Add a connect listener
io.sockets.on('connection', function(client){ 
	// Success!  Now listen to messages to be received
	client.on('message',function(event){
		console.log("message received: ", event) 
		procMessage(client, event)
	});

	client.on('disconnect',function(){
		console.log('Server has disconnected from client', client);
		users.remove(users.getUser(client.id)); 
	});

});
