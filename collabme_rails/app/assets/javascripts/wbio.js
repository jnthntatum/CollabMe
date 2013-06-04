/**
wbio.js
io functions for client
*/

var ioMessages = []; 
var ioSocket; 
var id;
var ioCanvSid;
var ioRails = 'http://localhost:3000/'; 
var ioChatServer = 'http://localhost:8989';
var ioFriendMap = {}
var ioPollEvent = null; 
var ioPolling = false; 

function Message(command, uid){
	this.command= command;
	this.uid = uid;
} 

function procError(message){
	console.log("Received error: ", message); 
}
var ioAckCallbacks = {}
function ioSetAckCallback(command, fn){
	if (typeof fn === 'function')
		ioAckCallbacks[command] = fn;
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
			uiShowWhiteboard(ioCanvSid);	
		}
		
	} else if (ackd.command === "STATUS") {
		console.log("now available requesting session")
		if (ackd.status && ackd.status !== 'OFFLINE'){
			ioGetFriends();
		} 
	} else if (ackd.command === "POST") {
		procPOST(message.ack); 
	} else if(ackd.command === "ERASE"){
		uiErase(); 
	} else if (ackd.command === "DELETE"){
		//yay! we deleted something!
	} else if (ackd.command === "HISTORY"){
		if (ackd.type === "chat_messages"){
			uiReloadMessages(ackd.chat_messages)
		} else if (ackd.type === "drawables"){
			uiSetDrawables(ackd.drawables)
		}
	}else if (ackd.command === "GET_STATUS") { 
		updateFriends(ackd) 
	}else if(ackd.command in ioAckCallbacks){
		var fn = ioAckCallbacks[ackd.command];
		fn(ackd)
	} else {

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
	} else if (message.command === "DELETE"){
		uiDeleteDrawable(message.idx);
	}else {
		console.log("Error, unhandled server command: " + message.command, message);
	}
}

function ioSendAdd(uids, sid){
	if(typeof sid !== 'number')
		sid=ioCanvSid; 
	var m = new Message(add, uid); 
	m.sid = sid;
	m.uids = uids;
	sendMessageToServer(m); 
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
		//if(typeof sid === 'number')
		//not suppported
	}
	var m = new Message("DELETE", uid); 
	m.idx = idx; 
	if (sid)
		m.sid = sid; 
	else
		m.sid = ioCanvSid;
	sendMessageToServer(m)

}

function ioCreateSession(drawing, uids){
	var m = new Message("CREATE", uid);
	m.uids= uids;
	m.drawing = drawing;
	sendMessageToServer(m);
}

function sendMessageToServer(message){
	id ++;
	message.id = id; 
	socket.emit('message', message);
	console.log("sent: ", message.command); 
}

function ioGetFriendStatus(){
	var m = new Message("GET_STATUS", uid);
	m.uids = []
	for (var key in ioFriendMap)
		m.uids.push(key);
	sendMessageToServer(m);	
}

function updateFriends(message){
	if (typeof message.uids === 'object'){
		for (var fid in message.uids){
			ioFriendMap[fid].status = message.uids[fid]
		}
	}
	uiSetFriendList(ioFriendMap);
	ioPollEvent= window.setTimeout(ioGetFriendStatus, 5000); 

}

function ioInit(){
	id = 0; 
	socket = io.connect(ioChatServer);
	socket.on('connect', function(){
		console.log('connection success!');
		var m = new Message("STATUS", uid)
		m.status = 'ONLINE'; 
		sendMessageToServer(m);  
	});
	socket.on('message', function(data){
		console.log('Received message from server', data)
		procMessage(data);  
	});
}

function ioGetFriends(){
	$.getJSON(ioRails+'researchers/'+uid+'/chat_list.json', undefined, function(friends){
		for (var i = 0; i < friends.length; i++){
			f = friends[i]; 
			ioFriendMap[f.id] = f;   
		}
		
		ioGetFriendStatus();
	})
}

function ioSendFlatten(layers){
	var m = new Message("FLATTEN", uid);
	m.sid = ioCanvSid(); 
	m.layers = layers;
	sendMessageToServer(m);
}

function ioSaveCanvas(img){
 	console.log('send io SaveCanvas -- todo')
}


