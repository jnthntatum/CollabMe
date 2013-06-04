/**
* Easy Canvas Event handling 
* Depends on JQuery
*
*/

var evDblClickThreshold = 1000

function _offset(sm){
	sm.top = jq.offset().top
	sm.left = jq.offset().left
}

evBindCanvas= function(id, aux){
	var sm = new StateMachine(aux);
	jq = $('#'+id )
	_offset(sm); 
	jq.mouseenter(_mousein)
	jq.mouseleave(_mouseout)
	jq.mousemove(_move)
	jq.mousedown(_mousedown);
	$('body').mouseup(_mouseupWrapper);
	stateMachines[id] = sm;

}

function myGetTime(){
	var d = new Date(); 
	var m = d.getMinutes()
	var s = d.getSeconds()
	var ms = d.getMilliseconds()
	return m * 60 * 1000 + s * 1000 + m; 
}

function evClearCallbacks(id){
	var sm = getStateMachine(id);
	sm.startDragfn = undefined
	sm.dragfn = undefined
	sm.stopDragfn = undefined
	sm.clickfn = undefined
	sm.dblclickfn = undefined
}

function evStartDrag(id, fn){
	var sm = getStateMachine(id);
	sm.startDragfn = fn; 
}

function evDrag(id, fn){
	var sm = getStateMachine(id);
	sm.dragfn = fn; 
}

function evStopDrag(id, fn){
	var sm = getStateMachine(id);
	sm.stopDragfn = fn; 
}

function evClick(id, fn){
	var sm = getStateMachine(id); 
	sm.clickfn = fn; 
}

function evDblClick(id, fn ){
	var sm = getStateMachine(id)
	sm.dblclickfn = fn;
}

function evSetAux(id, aux){
	var sm = getStateMachine(id);
	sm.aux = aux;
}

function evGetAux(id, aux){
	var sm = getStateMachine(id)
	sm.aux = aux; 
}

function evDetectOffset(id){
	var sm = getStateMachine(id);
	if (!sm)
		return false;
	_offset(getStateMachine(id));
	return;
}

//==================================
// Implementation details
//==================================

function debugSM(sm, pos){
	var text = "";
	if (sm.state==0){
		text = "not captured"
	}else if(sm.state == 1){
		text = "hover"
	}else if (sm.state == 2){
		text = "mouse down"
	}else if (sm.state == 3){
		text = "mouse down and out"
	}
	console.log("State:"+sm.state+": "+ text + " x:" + pos.x + " y:"+pos.y);
}

function testAndFire (cb, pos, aux){
	if(typeof cb === 'function')
		cb(pos);
}

var stateMachines = {};

function getStateMachine(id){
	if (typeof stateMachines[id] === undefined){
		console.log("err no such id" );
		return null;
	}
	else
		return stateMachines[id]; 
}

function StateMachine(aux){
	//0 not captured
	//1 hover
	//2 mouse down in object		//3 mouse down outside object
	this.state= 0
	this.left= 0
	this.top= 0
	this.cx = 0
	this.cy = 0
	this.drag= false
	this.disabled= false
	this.aux = aux;
	this.lastClick = 0; 
	this.coords= function (ev){
		pos = {}
		pos.y = ev.pageY - this.top;
		pos.x = ev.pageX - this.left; 
		return pos; 
	}
};

		

_move= function(ev){
	var sm = getStateMachine(this.id);
	if(sm.disabled)
		return;
	pos = sm.coords(ev);
	if (sm.state == 0 || sm.state == 1)
		return;
	if (sm.state == 2){
		if (!sm.drag){
			pos.oldX = sm.cx;
			pos.oldY = sm.cy;
			testAndFire(sm.startDragfn, pos, sm.aux)
			sm.drag = true;
		}
		testAndFire(sm.dragfn, pos, sm.aux)
		
	}  
}

_mousein= function(ev){
	var sm = getStateMachine(this.id);
	if (sm.disabled)
		return;
	pos = sm.coords(ev);
	if (sm.state == 0)
		sm.state = 1;
	if (sm.state == 3)
		sm.state = 2;	
}

_mouseout= function(ev){
	var sm = getStateMachine(this.id);
	if (sm.disabled)
		return;
	pos = sm.coords(ev);
	if (sm.state == 2)
		sm.state = 3
	if (sm.state == 1)
		sm.state = 0
	
}

_mousedown= function(ev){
	var sm = getStateMachine(this.id, ev);
	if(sm.disabled)
		return;
	pos = sm.coords(ev);
	sm.cx = pos.x
	sm.cy = pos.y
	if (sm.state == 1)
		sm.state = 2;
}		 

_mouseup= function(ev, sm){
	if (sm.disabled)
		return;
	pos = sm.coords(ev);
	if (sm.state == 2){
		sm.state = 1;
		if(!sm.drag){
			var t = myGetTime(); 
			if (t - sm.lastClick > evDblClickThreshold){
				testAndFire(sm.clickfn, pos, sm.aux)
			} else{
				testAndFire(sm.dblclickfn, pos, sm.aux)
			}
			sm.lastClick = t;
		}
	}
	if (sm.state == 3){
		sm.state = 0;
	}
	if(sm.drag){
		testAndFire(sm.stopDragfn, pos, sm.aux);  
		sm.drag=false; 
	}

}

_mouseupWrapper = function (ev){
	for (var sm in stateMachines){
		_mouseup(ev, stateMachines[sm]); 
	}
}