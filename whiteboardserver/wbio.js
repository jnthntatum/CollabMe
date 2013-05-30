/**
wbio.js
io functions for client
*/

var ioMessages = []; 
var ioSocket; 
var id;
var ioCanvSid;

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
	if (d.type === 'chat_message'){
		if (message.uid != uid){
			uiAddChatMessage(message.sid, d, idx); 
		}
	}
	else{
		uiAddDrawable(message.sid, d, idx) 
	}
}

function procAck(message){
	var ackd = message.ack; 
	if (ackd.command === "CREATE"){
		console.log ("session Created", message);
		console.log("id: ", message.sid);
		uiCreateChatWindow(message.sid) 
		if(ackd.drawing === true){
			ioCanvSid = message.sid;
			uiSetCanvasSid(ioCanvSid);	
		}
		
	} else if (ackd.command === "STATUS") {
		console.log("now available requesting session")
		ioCreateSession(true, [2, 3])
	} else if (ackd.command === "POST") {
		procPOST(message.ack); 
	} else if(ackd.command === "ERASE"){
		uiErase(); 
	} else if (ackd.command === "DELETE"){
		//ignore; 
	} else if (ackd.command === "HISTORY"){
		//TODO: 
	}else{
		console.log("Unhandled ack type")
	}
}

function procMessage(message){
	if (message.command === "POST"){
		procPOST(message);
	} else if (message.command === "ADD"){
		//received an invite to join a session

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
	m.sid = ioCanvSid;
	m.idx = idx; 
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
	m.sid = ioCanvSid
	sendMessageToServer(m);
}

function ioSendDelete(idx, chatMessage, sid){ 
	if(chatMessage){
		if(typeof sid === 'number')

	}	
}

function ioCreateSession(drawing, uids){
	var m = new Message("CREATE", uid);
	m.uids= uids;
	m.drawing = true;
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


