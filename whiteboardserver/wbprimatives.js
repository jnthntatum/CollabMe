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

Squiggle.prototype.draw = function( Canvas ){
	Canvas.beginPath();
	Canvas.lineWidth=this.lineWidth;
	Canvas.strokeStyle=this.color; 
	Canvas.moveTo(this.x, this.y);
	for (var i = 0; i < this.pts.length; i ++){
		pt = this.pts[i];
		Canvas.lineTo(pt[0], pt[1]);
	}
	//Canvas.closePath()
	Canvas.stroke();
}


function TextBox(x, y, z){ 
	Drawable.call(this, x, y)
	this.type = "text_box"
	this.text = ""
}

TextBox.prototype = new Drawable();

TextBox.prototype.draw = function ( canvas ){
// TODO:
}


if (typeof module == 'object' && module && typeof module.exports == 'object' && module.exports){
	module.exports.Squiggle = Squiggle;
	module.exports.TextBox = TextBox;
	module.exports.Drawable = Drawable;
}
