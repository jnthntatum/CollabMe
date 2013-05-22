/**
wbio.js
io functions for client
*/

var messages = []; 
var socket; 
var id;
var sid;

function Message(command, uid){
	this.command= command;
	this.uid = uid;
} 

function procError(message){
	console.log("Received error: ", message); 
}

function procPOST(message){
	var idx = message.idx;
	var d = parseJSON(message.data); 
	console.log("parsed d", d)
	uiAddDrawable(d, idx) 
}

function procAck(message){
	var ackd = message.ack; 
	if (ackd.command === "CREATE"){
		sid = message.sid;
		var m = new Message("ADD", uid);
		m.sid = sid; 
		m.uids = [2]; 
		sendMessageToServer(m); 
	} else if (ackd.command === "ADD") {
		console.log ("session Created");
	} else if (ackd.command === "POST") {
		procPOST(message.ack); 
	} else if(ackd.command === "ERASE"){
		uiErase(); 
	}else{
		console.log("Unhandled ack type")
	}
}

function procMessage(message){
	if (message.command === "POST"){
		procPOST(message);
	} else if (message.command === "ADD"){
		//TODO: logic for adding to session
	} else if (message.command === "ACK"){
		procAck(message); 
	} else if (message.command === "ERASE"){
		uiErase(); 
	} else {
		console.log("Error, unhandled server command: " + message.command, message);
	}
}

function ioSendDrawable(drawable){
	var m = new Message("POST", uid);
	m.sid = sid;
	m.data = drawable;
	sendMessageToServer(m);  
}

function ioSendErase(){
	var m = new Message("ERASE", uid);
	m.sid = sid
	sendMessageToServer(m);
}

function sendMessageToServer(message){
	id ++;
	message.id = id; 
	socket.emit('message', message);
	console.log("sent: ", message.command); 
}

function ioInit(){
	id = 0; 
	socket = io.connect('http://localhost:8989');
	socket.on('connect', function(){
		console.log('connection success!');
		sendMessageToServer(new Message("STATUS", uid)); 
		sendMessageToServer(new Message("CREATE", uid)); 
	});
	socket.on('message', function(data){
		console.log('Received message from server', data)
		procMessage(data);  
	});
}


