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
var uiSelection = undefined;
var uiMode = "Squiggle"
var	uiSensitivity = 8
//====================================
//EVENT HANDLING
//====================================


function max(a, b){
	return (a >= b)? a : b;
}

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
	
	curDrawable = null;

	uiRedraw();
}

function bindSquiggleFns(id){
	evStartDrag(id, sSquiggleDragFn)
	evDrag(id, squiggleDragFn)
	evStopDrag(id, eSquiggleDragFn)
}

function sTextDragFunction(pos){
	console.log("curDrawable is a new Text Box")
	curDrawable = new TextBox(pos.oldX, pos.oldY, pos.x-pos.oldX, pos.oldY);
	curDrawable.resizing = true; 
	uiRedraw()
}

function textDragFunction(pos){
	var w = pos.x - curDrawable.x;
	var h = pos.y - curDrawable.y;
	curDrawable.w = w;
	curDrawable.h = h;  
	uiRedraw()
}

function eTextDragFunction(pos){
	
	curDrawable.text = "Click to add Text";  
	curDrawable.resizing = false; 
	ioSendDrawable(curDrawable);
	curDrawable = null;
	
	uiRedraw();
}

function bindTextFns(id){
	evStartDrag(id, sTextDragFunction)
	evDrag(id, textDragFunction)
	evStopDrag(id, eTextDragFunction)
	uiRedraw()
}

function sSquareDragFunction(pos){
	console.log("new Square!")
	curDrawable = new Square(pos.oldX, pos.oldY, pos.x-pos.oldX, pos.oldY);
	curDrawable.color = curColor; 
	curDrawable.resizing = true; 
	uiRedraw()
}

function squareDragFunction(pos){
	var w = pos.x - curDrawable.x;
	var h = pos.y - curDrawable.y;
	curDrawable.w = w;
	curDrawable.h = h;  
	uiRedraw()
}

function eSquareDragFunction(pos){
	curDrawable.resizing = false; 
	ioSendDrawable(curDrawable);
	curDrawable = null;
	uiRedraw();
}

function bindSquareFns(id){
	evStartDrag(id, sSquareDragFunction)
	evDrag(id, squareDragFunction)
	evStopDrag(id, eSquareDragFunction)
	uiRedraw()
}

function uiDeleteDrawable(){

} 

function dist(x1, y1, x2, y2){
	return Math.sqrt(dist2(x1, y1, x2, y2));
}

function dist2(x1, y1, x2, y2 ){
	var dx = x1- x2; 
	var dy = y1- y2; 
	console.log('distance: ', (dy * dy) + (dx *dx)  )
	return ((dy * dy) + (dx *dx)); 
}

function hitBox(pos){
	var len = drawables.length;
	for (var i = 0; i < len; i ++){
		var d = drawables[i]; 
		console.log("pos: ", pos);
		console.log("d: ", d);
		if (dist(d.x, d.y, pos.oldX, pos.oldY) <= uiSensitivity){
			return d;
		}  
	}
	return null;
}

function sSelectorDblClick(pos){
	//delete object
	var target = hitBox(pos);
	if (target){
		//delete
	}
}

function selectorClickFn(pos){
	uiSelection = hitBox(pos); 
}

function sSelectorDragFn(pos){
	uiSelection = hitBox(pos);
	if (!uiSelection)
		return;
	uiSelection.x = pos.x;
	uiSelection.y = pos.y;
	uiRedraw();
}

function selectorDragFn(pos){
	if(!uiSelection)
		return
	uiSelection.x = pos.x;
	uiSelection.y = pos.y;
	uiRedraw()
}

function eSelectorDragFn(pos){
	uiSelection = null;
	uiRedraw();
}

function bindSelectorFns(id){
	evClick(id, selectorClickFn)
	evStartDrag(id, sSelectorDragFn)
	evDrag(id, selectorDragFn)
	evStopDrag(id, eSelectorDragFn)
	uiRedraw()
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
	el.innerHTML = "&nbsp;";
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

function uiSelector(){ 
	var el = document.createElement("div")
	el.setAttribute("class", "tool selector")
	el.innerHTML = "Se"
	return el; 
}

function uiToolBar(){
	var tb  = document.createElement("div");  
	tb.setAttribute("class", "toolBar"); 
	tb.appendChild(uiColorPicker());
	tb.appendChild(uiEraser())
	tb.appendChild(uiSquiggle())
	tb.appendChild(uiTextBox())
	tb.appendChild(uiSquare())
	tb.appendChild(uiCircle()) 
	tb.appendChild(uiSelector());
	return tb 
}

function attachToolBarHandlers(){
	$(".color_option").click(function(){
		curColor = $(this).attr('color'); 
		$(".color_selected").removeClass("color_selected")
		$(this).addClass("color_selected")
	});

	$('.tool').click(function(){
		$(".tool_selected").removeClass("tool_selected")
		$(this).addClass("tool_selected")
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
			bindSquareFns(canvasID)
		}

	});
	$('.circle').click(function(){
		if (uiMode != "Circle"){
			uiMode = "Circle"
			bindSquiggleFns(canvasID)
		}
	}); 
	$('.selector').click(function(){
		if (uiMode != "Selector"){
			uiMode = "Selector"
			bindSelectorFns(canvasID)
		}
	});

}

//=============================
//	Adding a canvas / session pair
//=============================

function uiCanvas(id){
	var c = document.createElement("canvas")
	c.id = id;
	c.setAttribute('sid', id);
	c.setAttribute("class", "whiteBoard");
	c.setAttribute("width", "1000");
	c.setAttribute("height", "500") 
	ctx = c.getContext("2d")
	return c; 
}

function uiInit(id){
	var wrapper = $(".canvasWrapper")[0];
	wrapper.appendChild(uiToolBar());
	attachToolBarHandlers();  
	wrapper.appendChild(uiCanvas(id));  
	evBindCanvas(id);
	bindSquiggleFns(id);
	canvasID = id; 
}

function makeChatLine(author, text){
	var val = "<b>" + author + ": </b>" + text 
	var el = document.createElement("p");
	el.setAttribute("class", "chat chat_message")
	el.innerHTML = val; 
	return el; 
}

//Adding a chat window / Session pair
function chatKeyupCB(ev){
	var chat_window = $(this).parent()
	var mSid = chat_window.attr('sid')
	console.log("keyup at ", this)
	console.log('ev.keycode', ev.keycode) 
	if (ev.keyCode === 13){
		//enter so send a message!
		var inp = $("textarea", this)[0];
		$('.chat_history', chat_window)[0].appendChild(makeChatLine("Me", inp.value))
		inp.value = "";
	}
}

function bindCWListeners(context){ 
	$('.chat_input_wrapper', context).keyup(chatKeyupCB)
} 

function uiChatWindow(sid){
	var nub = document.createElement("div")
	nub.setAttribute("class", "chat chat_nub");

	var wind = document.createElement("div")
	wind.setAttribute("class", "chat chat_window")
	wind.setAttribute("sid", sid)
	var hist = document.createElement("div")
	hist.setAttribute("class", "chat chat_history")
	var inpDiv = document.createElement("div")
	inpDiv.setAttribute("class", "chat chat_input_wrapper")
	var inp = document.createElement("textarea")
	inpDiv.appendChild(inp);
	wind.appendChild(hist)
	wind.appendChild(inpDiv);
	nub.appendChild(wind);
	return nub; 
	//inp.setAttribute() 

}

function uiCreateChatWindow(sid){
	var container = $('.chat_bar')[0];
	var cwind = uiChatWindow(sid); 
	container.appendChild(cwind); 
	bindCWListeners(cwind) 
}