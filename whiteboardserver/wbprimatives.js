/**
*wbprimatives.js
*/



function Drawable(x, y){
	this.x = x
	this.y = y
	this.type='abstract_drawable'
}

Drawable.prototype.draw = function( Canvas )
{
	console.log("ERROR: tried to draw an abstract type"); 
}

function Squiggle(x,y){
	Drawable.call(this, x, y)
	this.pts = []; 
	this.color = "black";
	this.lineWidth = "5"
	this.type = "squiggle"
}
Squiggle.prototype  = new Drawable()

Squiggle.prototype.draw = function(	canvas ){
	canvas.beginPath();
	canvas.lineWidth=this.lineWidth;
	canvas.strokeStyle=this.color; 
	canvas.moveTo(this.x, this.y);
	for (var i = 0; i < this.pts.length; i ++){
		pt = this.pts[i];
		canvas.lineTo(pt[0], pt[1]);
	}
	canvas.stroke();
}


function TextBox(x, y, z){ 
	Drawable.call(this, x, y)
	this.type = "text_box"
	this.text = ""
}

TextBox.prototype = new Drawable();

TextBox.prototype.draw = function ( canvas ){
// TODO:
	
	context.font = '10px sans-serif'
	context.fillStyle = 'black';
	context.fillText(this.text, this.x, this.y); 
}

function ChatMessage (name, text){
	this.name = name;
	this.text = text;
	this.type = 'chat_message';
}

if (typeof module == 'object' && module && typeof module.exports == 'object' && module.exports){
	module.exports.Squiggle = Squiggle;
	module.exports.TextBox = TextBox;
	module.exports.Drawable = Drawable;
	module.exports.ChatMessage = ChatMessage; 
}
