/**
wbUI.js
functions are prefixed with ui
*/

var ctx;
var curColor = "blue";  
var count = 0; 
var drawables = []; 
var curDrawable = []; 
var w = 1000;
var h = 500;

function sDragFn(pos){
	console.log("curDrawable now not null")
	curDrawable = new Squiggle(pos.x, pos.y);
	curDrawable.color = curColor;
}		

function dragFn(pos){
	curDrawable.pts.push([pos.x, pos.y]) 
	if (count % 3 == 0 )
		uiRedraw();
	count ++;
}


function eDragFn(pos){
	curDrawable.pts.push([pos.x, pos.y])
	ioSendDrawable(curDrawable);
	console.log("curDrawable now null")
	curDrawable = null;
	uiRedraw();
}

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

var colors = ["black", "green", "blue", "red", "purple"]

function uiErase(){
	drawables = []; 
	uiRedraw();
}

function uiColorBlock(color){
	var el = document.createElement("div")
	el.setAttribute("class", "tool_button color_option")
	el.setAttribute("color", color);
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
	el.innerHTML = "erase"
	
	return el; 
}

function uiToolBar(){
	var tb  = document.createElement("div");  
	tb.setAttribute("class", "toolBar"); 
	tb.appendChild(uiColorPicker());
	tb.appendChild(uiEraser())
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
	$('.eraser').click(function (){
		ioSendErase(); 
	});
}

function uiInit(id){
	var wrapper = $(".canvasWrapper")[0];
	wrapper.appendChild(uiToolBar());
	attachToolBarHandlers();  
	wrapper.appendChild(uiCanvas(id));  
	evBindCanvas(id);
	evStartDragfn(id, sDragFn)
	evDragfn(id, dragFn)
	evStopDragfn(id, eDragFn)
}

