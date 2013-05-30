/**
wbUI.js
functions are prefixed with ui
*/

var uiCtx
var uiColors = ["blue", "green", "purple", "red", "yellow", "black"]
var uiCurColor = "blue";  
var canvasID = "" 
var count = 0; 
var uiDrawables = []; 
var messageScrollback = []
var curDrawable = null; 
var w = 1000;
var h = 500;
var uiSelection = null;
var uiMode = "Squiggle"
var	uiSensitivity = 8
var name = undefined;
//====================================
//EVENT HANDLING
//====================================


function dblclickCB(pos){
	if (uiMode === 'Selector'){
		var idx = hitBox(pos);
		if (idx != null){
			uiDeleteDrawable(idx);
		}
	}
}

function max(a, b){
	return (a >= b)? a : b;
}

function sSquiggleDragFn(pos){
	console.log("curDrawable now not null")
	curDrawable = new Squiggle(pos.oldX, pos.oldY);
	curDrawable.pts.push([pos.x, pos.y]);
	curDrawable.color = uiCurColor;
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
	curDrawable.color = uiCurColor; 
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

function uiDeleteDrawable(idx){
	uiDrawables[idx] = null;
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
	var len = uiDrawables.length;
	for (var i = 0; i < len; i ++){
		var d = uiDrawables[i];
		if (!d)
			continue 
		console.log("pos: ", pos);
		console.log("d: ", d);
		if (dist(d.x, d.y, pos.oldX, pos.oldY) <= uiSensitivity){
			return i;
		}  
	}
	return null;
}

function sSelectorDblClick(pos){
	//delete object
	var target = hitBox(pos);
	if (target != null){
		var d = uiDrawables[target];
		if(!d){
			return
		}
		ioSendDrawable(null, uiSelection);
	}S
}

function selectorClickFn(pos){
	uiSelection = hitBox(pos); 
}

function sSelectorDragFn(pos){
	uiSelection = hitBox(pos);
	if (uiSelection == null)
		return;
	var d = uiDrawables[uiSelection];
	if (!d){
		return; 
	} 
	d.x = pos.x;
	d.y = pos.y;

	uiRedraw();
}

function selectorDragFn(pos){
	if (uiSelection == null)
		return;
	var d = uiDrawables[uiSelection];
	if (!d){
		return; 
	} 
	d.x = pos.x;
	d.y = pos.y;
	
	uiRedraw()
}

function eSelectorDragFn(pos){
	if (uiSelection == null)
		return;
	var d = uiDrawables[uiSelection];
	if (!d){
		uiSelection = null;
		return; 
	} 
	ioSendDrawable(d, uiSelection);
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

function uiAddDrawable(sid, drawable, idx){
	var canvas=getCanvas(sid);
	if (canvas === null){
		console.log('error no canvas for session ', sid);
		return
	}
	console.log('updated obj at idx: ', idx)
	uiDrawables[idx] = drawable; 
	uiRedraw(canvas.getContext('2d'));	
}

function uiRedraw(ctx){
	if(!ctx)
		ctx = uiCtx; 
	ctx.clearRect(0, 0, w, h);
	for (var i = 0; i < uiDrawables.length; i ++){
		var d = uiDrawables[i]
		if(d){
			d.draw(ctx);
			if (uiMode === 'Selector'){
				ctx.save(); 
				ctx.fillStyle = "red";
				ctx.strokeStyle = "rgba(0,0,0,30)";
				ctx.lineWidth = "3"
				var delta = uiSensitivity 
				var x = d.x ;
				var y = d.y ; 
				ctx.fillRect(x-delta, y-delta, 2*delta, 2*delta)
				ctx.strokeRect(x-delta, y-delta, 2*delta, 2*delta)  
				ctx.restore(); 
			}
		}

	}
	if (curDrawable)
		curDrawable.draw(ctx);
} 

function uiErase(){
	uiDrawables = []; 
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
	for (var i = 0; i< uiColors.length; i ++ ){
		el.appendChild(uiColorBlock(uiColors[i])); 
	}
	return el; 
}


function uiSimpleTool(toolName, toolText){
	var el = document.createElement("div")
	el.setAttribute("class", "tool " + toolName); 
	el.innerHTML = toolText
	return el; 
}

function uiToolBar(){
	var tb  = document.createElement("div");  
	tb.setAttribute("class", "toolBar"); 
	tb.appendChild(uiColorPicker());
	tb.appendChild(uiSimpleTool("eraser", "E"))
	tb.appendChild(uiSimpleTool("squiggle", "SQ"))
	tb.appendChild(uiSimpleTool("text_box", "T"))
	tb.appendChild(uiSimpleTool("square", "s"))
	tb.appendChild(uiSimpleTool("circle", "c")) 
	tb.appendChild(uiSimpleTool("selector", "se"));
	tb.appendChild(uiSimpleTool("flatten", "F"));
	return tb 
}

function attachToolBarHandlers(){
	$(".color_option").click(function(){
		uiCurColor = $(this).attr('color'); 
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
	$('.text_box').click(function(){
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
	$('.flatten').click(function(){
		//todo 
	})

}

//=============================
//	Adding a canvas / session pair
//=============================

function uiSetCanvasSid(sid, canvas){
	if (!canvas){
		canvas = getCanvas('detached');
		if (!canvas){
			console.log("couldn't update canvas -- undefined")
			return;
		} 
	}
	canvas.setAttribute("sid", sid); 
}

function getCanvas(sid){
	var tmp = $("canvas[sid='"+ sid+ "']");
	if (tmp.length > 0)
		return tmp[0];
	else 
		return null; 
}

function uiCanvas(id){
	var c = document.createElement("canvas")
	c.id = id;
	c.setAttribute('sid', id);
	c.setAttribute("class", "whiteBoard");
	c.setAttribute("width", "1000");
	c.setAttribute("height", "500") 
	uiCtx = c.getContext("2d")
	return c; 
}

function uiInit(id){
	var wrapper = $(".canvasWrapper")[0];
	name=uid;
	wrapper.appendChild(uiToolBar());
	attachToolBarHandlers();  
	wrapper.appendChild(uiCanvas(id));  
	evBindCanvas(id);
	bindSquiggleFns(id);
	$("canvas[sid='" + id + "']").doubleClick(dblclkCB);  
	canvasID = id; 
}


//=====================================
// IM functions
//=====================================

function uiFlattenCanvas(layers){
	if (!layers)
		layers = uiDrawables.length
	for (var i = 0; i < layers; i ++){
		var d = drawables[i]; 
		if(d){
			d.draw(ctx); 
		}
	}
	return ctx.canvas.toDataURL();  

} 

function uiAddChatMessage(sid, message, idx){
	messageScrollback[idx] = message; 
	var w = $("div[sid='" + sid + "']");
	if (w.length == 0){
		var tmp = uiCreateChatWindow(sid);
		w = $("div[sid='" + sid + "']", tmp);
	}
	addLine(w, message.name, message.text)
}

function makeChatLine(author, text){
	var val = "<b>" + author + ": </b>" + text 
	var el = document.createElement("p");
	el.setAttribute("class", "chat chat_message")
	el.innerHTML = val; 
	return el; 
}

function addLine(context, author, value){
	$('.chat_history', context)[0].appendChild(makeChatLine(author, value))
}

function chatKeyupCB(ev){
	var chat_window = $(this).parent()
	var mSid = chat_window.attr('sid')
	if (ev.keyCode === 13){
		//enter so send a message!
		var inp = $("textarea", chat_window)[0];
		addLine(chat_window, "Me",  inp.value)
		var m = new ChatMessage(name, inp.value);
		ioSendChatMessage(m, mSid); 
		inp.value = ""
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
	return cwind;
}