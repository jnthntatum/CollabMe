/**
wbio.js
io functions for client
*/

var messages = []; 
var socket; 
var id; 
function Message(command, uid){
	this.command= command;
	this.uid = uidl 
} 

function procAck(message){

}

function procMessage(message){
	
}

function ioInit(){
	id = 0; 
	socket = io.connect('http://localhost:8989');
	socket.on('connect', function(){
		console.log('connection success!'); 
	});
	socket.on('message', function(data){
		console.log('Received message from server', data)
		procMessage(data);  
	});
}

function sendMessageToServer(message){
	socket.json.send(message);
	console.log("sent: ", message.command); 
}