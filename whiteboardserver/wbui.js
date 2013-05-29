/**
wbUI.js
functions are prefixed with ui
*/

var ctx;
var colors = ["blue", "green", "purple", "red", "yellow", "black"]
var curColor = "blue";  
var canvasID = "" 
var count = 0; 
var drawables = []; 
var curDrawable = []; 
var w = 1000;
var h = 500;
//====================================
//EVENT HANDLING
//====================================
var uiMode = "Squiggle"

function sSquiggleDragFn(pos){
	console.log("curDrawable now not null")
	curDrawable = new Squiggle(pos.oldX, pos.oldY);
	curDrawable.pts.push([pos.x, pos.y]);
	curDrawable.color = curColor;
}		

function squiggleDragFn(pos){
	curDrawable.pts.push([pos.x, pos.y]) 
	if (count % 3 == 0 )
		uiRedraw();
	count ++;
}

function eSquiggleDragFn(pos){
	curDrawable.pts.push([pos.x, pos.y])
	ioSendDrawable(curDrawable);
	console.log("curDrawable now null")
	curDrawable.text = "Click to add Text";  
	curDrawable.resizing = false; 
	curDrawable = null;

	uiRedraw();
}

function bindSquiggleFns(id){
	evStartDragfn(id, sSquiggleDragFn)
	evDragfn(id, squiggleDragFn)
	evStopDragfn(id, eSquiggleDragFn)
}

function sTextDragFunction(pos){
	console.log("curDrawable is a new Text Box")
	curDrawable = new TextBox(pos.oldX, pos.oldY, pos.x-pos.oldX, pos.oldY);
	curDrawable.resizing = true; 
}

function textDragFunction(pos){
	var w = pos.x - curDrawable.x;
	var h = pos.y - curDrawable.y;
	curDrawable.w = w;
	curDrawable.h = h;  
}

function eTextDragFunction(pos){
	//stop drawing the texbox
}

function bindTextFns(id){
	evStartDragfn(id, sTextDragFunction)
	evDragfn(id, textDragFunction)
	evStopDragfn(id, eTextDragFunction)
}

//==================================
// drawing functions
//==================================

function uiAddDrawable(drawable, idx){
	drawables[idx] = drawable; 
	uiRedraw();	
}

function uiRedraw(){
	ctx.clearRect(0, 0, w, h);
	for (var i = 0; i < drawables.length; i ++){
		if(drawables[i])
			drawables[i].draw(ctx);
	}
	if (curDrawable)
		curDrawable.draw(ctx);
} 

function uiErase(){
	drawables = []; 
	uiRedraw();
}

//==========================================
// TOOL BAR BUILDING
//==========================================

function uiColorBlock(color){
	var el = document.createElement("div")
	el.setAttribute("class", "tool_button color_option")
	el.setAttribute("color", color);
	el.setAttribute("style", "background-color: " + color); 
	el.innerHTML = color;
	return el; 
}

function uiColorPicker(){
	var el = document.createElement("div");
	el.setAttribute("class", "tool color_picker");
	for (var i = 0; i< colors.length; i ++ ){
		el.appendChild(uiColorBlock(colors[i])); 
	}
	return el; 
}

function uiEraser(){
	var el = document.createElement("div"); 
	el.setAttribute("class", "tool eraser")
	el.innerHTML = "Er"	
	return el; 
}

function uiSquiggle(){
	var el = document.createElement("div"); 
	el.setAttribute("class", "tool squiggle")
	el.innerHTML = "Sq"	
	return el; 
}

function uiTextBox(){
	var el = document.createElement("div");
	el.setAttribute("class", "tool textbox");
	el.innerHTML = "T"
	return el; 
}

function uiSquare(){
	var el = document.createElement("div")
	el.setAttribute("class", "tool square")
	el.innerHTML = "S"
	return el; 
}

function uiCircle(){
	var el = document.createElement("div")
	el.setAttribute("class", "tool square")
	el.innerHTML = "C"
	return el; 
}

function uiToolBar(){
	var tb  = document.createElement("div");  
	tb.setAttribute("class", "toolBar"); 
	tb.appendChild(uiColorPicker());
	tb.appendChild(uiEraser())
	tb.appendChild(uiTextBox())
	tb.appendChild(uiSquare())
	tb.appendChild(uiCircle()) 
	return tb 
}

function uiCanvas(id){
	var c = document.createElement("canvas")
	c.id = id;
	c.setAttribute("class", "whiteBoard");
	c.setAttribute("width", "1000");
	c.setAttribute("height", "500") 
	ctx = c.getContext("2d")
	return c; 
}

function attachToolBarHandlers(){
	$(".color_option").click(function(){
		curColor = $(this).attr('color'); 
		$(".color_selected").removeClass("color_selected")
		$(this).addClass("color_selected")
	});
	$('.squiggle').click(function(){
		if(uiMode != "Squiggle"){
			uiMode = "Squiggle"
			bindSquiggleFns(canvasID);
		}
	});
	$('.textbox').click(function(){
		if(uiMode != "TextBox"){
			uiMode = "TextBox"
			bindTextFns(canvasID);
		}
	}); 
	$('.eraser').click(function (){
		ioSendErase(); 
	});
	$('.square').click(function(){
		if (uiMode!= "Square"){
			uiMode = "Square"
			bindSquiggleFns(canvasID)
		}

	});
	$('circle').click(function(){
		if (uiMode != "Circle"){
			uiMode = "Circle"
			bindSquiggleFns(canvasID)
		}
	}); 

}

//=============================
//	initializer
//=============================

function uiInit(id){
	var wrapper = $(".canvasWrapper")[0];
	wrapper.appendChild(uiToolBar());
	attachToolBarHandlers();  
	wrapper.appendChild(uiCanvas(id));  
	evBindCanvas(id);
	bindSquiggleFns(id);
	canvasID = id; 
}

