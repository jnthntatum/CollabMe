/**
wbUI.js
functions are prefixed with ui
*/

var ctx;
var curColor = "blue";  
var count = 0; 


function sDragFn(pos){
	cur = new Squiggle(pos.x, pos.y);
	cur.color = curColor;
	drawables.push(cur) 
}		

function dragFn(pos){
	cur.pts.push([pos.x, pos.y]) 
	if (count % 3 == 0 )
		uiRedraw();
	count ++;
}

function eDragFn(pos){
	cur.pts.push([pos.x, pos.y])
	sendMessageToServer(cur); 
	uiRedraw();
}

function uiRedraw(){
	for (var i = 0; i < drawables.length; i ++){
		drawables[i].draw(ctx);
	}
} 

var colors = ["black", "green", "blue", "red", "purple"]

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

function uiToolBarify(el){
	el.appendChild(uiColorPicker());
	el.appendChild(uiEraser())
}

function uiInit(id){
	toolBarify($(".toolBar")[0])
	$(".color_option").click(function(){
	curColor = $(this).attr('color'); 
		$(".color_selected").removeClass("color_selected")
		$(this).addClass("color_selected")
	});
	ctx = $('#'+id)[0].getContext("2d");
	evBindCanvas(id);
	evStartDragfn(id, sDragFn)
	evDragfn(id, dragFn)
	evStopDragfn(id, eDragFn)
}

