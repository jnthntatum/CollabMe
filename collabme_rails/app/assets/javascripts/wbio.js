/**
wbio.js
io functions for client
*/

var ioSocket; 
var id;
var ioCanvSid;
var ioRails = 'http://localhost:3000/'; 
var ioChatServer = 'http://localhost:8989';
var ioFriendMap = {}
var ioPollEvent = null; 
var ioStatusPollTO = 5000;
var ioSaveStateTO = 10000;
var ioConnectRetries = 0; 
var ioSessions = {}

function Session(sid){
	this.sid = sid
	this.drawables = []
	this.messages = []
	this.uids = []
	this.hasUser = function (uid){
		if (this.uids.indexOf(uid) == -1)
			return false; 
		else 
			return true;
	}
	this.addUser = function (uid){
		if (this.hasUser(uid))
			return false
		uids.push(uid)
		return true;
	}
	this.noUsers = function (){
		return uids.length == 0;
	}
	
}

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
	var sid = message.sid; 
	var s;
	if (sid in ioSessions){
		s = ioSessions[s];
	} else {
		s = new Session(sid); 
		ioSessions[sid] = s;
	}
	if (d.type === 'chat_message'){
		if (message.uid != uid){
			uiAddChatMessage(sid, d, idx); 
			s.messages[idx] = d; 
		}
	}
	else{
		uiAddDrawable(sid, d, idx)
		s.drawables[idx] = d;
	}
}

function procCreate(message){
		console.log ("session Created. id: " + message.sid, message);
		var sid = message.sid;
		if (sid in ioSessions){
			console.log('session collision')
		}
		var s = new Session(sid);
		s.uids = message.uids;
		ioSessions[sid] = s;   
		uiCreateChatWindow(sid) 
		if(message.drawing === true){
			ioCanvSid = sid; 
			uiShowWhiteboard(ioCanvSid);	
		}
}

function procAck(message){
	var ackd = message.ack; 
	if (ackd.command === "CREATE"){
		procCreate(ackd) 
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
	}else if(ackd.command === 'FLATTEN'){
		//send a saved copy to the server
		var imgData = ackd.img;
		ioSaveCanvas(imgData); 
	}else if(ackd.command in ioAckCallbacks){
		var fn = ioAckCallbacks[ackd.command];
		fn(ackd)
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
	}else if (message.command === "FLATTEN"){
		uiFlattenCanvas(message.layers, parse(message.img))
	}else{
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
	console.log("Sending Chat message: " + m);
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



function ioGetFriends(){
	$.getJSON(ioRails+'researchers/'+uid+'/chat_list.json', undefined, function(friends){
		for (var i = 0; i < friends.length; i++){
			f = friends[i]; 
			ioFriendMap[f.id] = f;   
		}
		ioGetFriendStatus();
	})
}

function ajaxError(err){
	console.log('ajax error')
	if (err){
		console.log('cause: ', err)
	}
	console.log('cause unknown');
}

function saveAll(){
	for (var sid in ioSessions){
		var s = ioSessions[sid]; 
		if (s.uids.length == 1){
			ioSaveState(s.messages, s.drawables, s.uids[0]) 
		}
	} 
	window.setTimeout(saveAll, ioSaveStateTO)
}

function saveResponse(data){
	console.log('save success!')
}

function ioSaveState(messages, drawables, uid, group){
	$.ajax(
		{ 	type: "POST",
			url: ioRails + '/chat_sessions/save.json',
			contentType: "application/json",
			dataType: "json",
			data: JSON.stringify({"messages_blob": messages, "drawables_blob": drawables, "uid" : uid} ),
			success: saveResponse,
			failure: ajaxError}
		);
}

function restoreState(data){
	console.log('got db message state -- updating scrollback')
	console.log('todo--')
}

function ioReadState(uid1, uid2, group){
		$.ajax(
		{ 	type: "POST",
			url: ioRails + '/chat_sessions/read.json',
			contentType: "application/json",
			dataType: "json",
			data: JSON.stringify({"uid" : uid}),
			success: restoreState,
			failure: ajaxError }
		);
}

function ioSendFlatten(layers, img){
	var m = new Message("FLATTEN", uid);
	m.sid = ioCanvSid; 
	m.layers = layers;
	m.img = img
	sendMessageToServer(m);
}

function ioSaveCanvas(img){
 	console.log('send io SaveCanvas -- todo')
}

function ioInit(){
	id = 0; 
	socket = io.connect(ioChatServer);
	socket.on('connect', function(){
		ioConnectRetries = 0; 
		console.log('connection success!');
		var m = new Message("STATUS", uid)
		m.status = 'ONLINE'; 
		sendMessageToServer(m);
		window.setTimeout(saveAll, ioSaveStateTO);  
	});
	socket.on('connect_failed', function () {
		if (ioRetries > 2)
			uiSetFriendListTitle('There seems to be trouble connecting to the chat server')
		else
			uiSetFriendListTitle('Waiting for connection to server')
		window.setTimeout(ioInit, 5000)
		ioRetries ++; 
	});
	socket.on('message', function(data){
		console.log('Received message from server', data)
		procMessage(data);  
	});
	socket.on('disconnect', function (){
		console.log('disconnected from the server')
	}); 
}




