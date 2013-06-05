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


function TextBox(x, y, w, h){ 
	Drawable.call(this, x, y)
	this.w = w; 
	this.h = h;
	this.type = "text_box"
	this.style = "black"
	this.text = ""
	
}

TextBox.prototype = new Drawable();

TextBox.prototype.draw = function ( canvas ){	
	if (this.resizing){
		canvas.lineWidth = '2'
		canvas.strokeStyle = 'rgba(0,0,0,128)'
		canvas.strokeRect(this.x, this.y, this.w, this.h); 
	}else{
		canvas.font = '10px sans-serif'
		canvas.fillStyle = this.style;
		canvas.fillText(this.text, this.x, this.y); 
	}	
}

function Circle(x, y, r){
	Drawable.call(this, x, y);
	this.r = r; 
	this.type = "circle"
	this.color = "black"
}

Circle.prototype = new Drawable(); 

Circle.prototype.draw = function( canvas ){
	var x = this.x
	var r = this.r
	var y = this.y 
	canvas.fillStyle = this.color; 
	canvas.fillRect(x - r, y - r, 2 * r, 2 * r);
}

function Square(x, y, w, h){
	Drawable.call(this, x, y);
	this.w = w; 
	this.h = h;
	this.type = "square" 
	this.color = 'black'
}

Square.prototype = new Drawable(); 

Square.prototype.draw = function( canvas ){
	canvas.fillStyle = this.color;
	canvas.fillRect(this.x, this.y, this.w, this.h); 
}

function DImage(x, y, src){
	if(typeof x !== 'number')
		x = 0;
	if(typeof y !== 'number')
		y = 0; 
	Drawable.call(this, x, y)
	this.src = src; 
}

DImage.prototype = new Drawable();

DImage.prototype.draw = function (canvas, reload){
	if (!this.img || reload){
		this.img = new Image(); 
		this.img.src= this.src
	} 
	canvas.drawImage(this.img, this.x, this.y)
}

function ChatMessage (name, text){
	this.name = name;
	this.text = text;
	this.type = 'chat_message';
}


function primCopy(template, json){
	for(var key in template){
		if(typeof template[key] == 'function')
			continue; 
		if (!(key in json))
			return null;
		template[key] = json[key]
	}
	return template; 
}

/**
return an instance of the of the object if parseable from JSON
else null
*/
function parseJSON(message){
	if(!(typeof message.type === 'string'))
		return null
	var t = message.type;
	var template; 
	if (t === "text_box")
		template = new TextBox(0, 0)
	else if(t === "squiggle")
		template = new Squiggle(0, 0)
	else if(t === "chat_message")
		template = new ChatMessage("", "")
	else if(t === "circle")
		template =  new Circle(0, 0, 0)
	else if(t === "square")
		template = new Square(0, 0, 0, 0)
	else if(t === "image")
		template = new Image("", 0, 0); 
	else
		return null;
	return primCopy(template, message);

}


if (typeof module == 'object' && module && typeof module.exports == 'object' && module.exports){
	module.exports.Squiggle = Squiggle;
	module.exports.TextBox = TextBox;
	module.exports.Drawable = Drawable;
	module.exports.ChatMessage = ChatMessage;
	module.exports.Circle = Circle; 
	module.exports.Square = Square;
	module.exports.DImage = DImage;
	module.exports.parseJSON = parseJSON
}
