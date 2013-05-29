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
	if (d.type === 'chat_message')
		uiAddChatMessage(d, idx); 
	else
		uiAddDrawable(d, idx) 
}

function procAck(message){
	var ackd = message.ack; 
	if (ackd.command === "CREATE"){
		console.log ("session Created", message);
		console.log("id: ", message.sid);
		uiCreateChatWindow(message.sid) 
		sid = message.sid;
	} else if (ackd.command === "STATUS") {
		console.log("now available requesting session")
		ioCreateSession([2, 3])
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

function ioSendDrawable(drawable, idx){
	var m = new Message("POST", uid);
	m.sid = sid;
	m.dIdx = idx; 
	m.data = drawable;
	sendMessageToServer(m);  
}

function ioSendChatMessage(message, lSid){
	var m = new Message("POST", uid);
	m.sid = parseInt(lSid);
	m.data = message;
	sendMessageToServer(m);  
}

function ioSendErase(){
	var m = new Message("ERASE", uid);
	m.sid = sid
	sendMessageToServer(m);
}

function ioCreateSession(uids){
	var m = new Message("CREATE", uid);
	m.uids= uids;
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
	});
	socket.on('message', function(data){
		console.log('Received message from server', data)
		procMessage(data);  
	});
}


