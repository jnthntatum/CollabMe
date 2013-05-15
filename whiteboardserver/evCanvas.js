/**
* Easy Canvas Event handling 
* Depends on JQuery
*
*/

evBindCanvas= function(id){
	sm = new StateMachine();
	jq = $('#'+id )
	sm.top = jq.offset().top
	sm.left = jq.offset().left
	jq.mouseenter(_mousein)
	jq.mouseleave(_mouseout)
	jq.mousemove(_move)
	jq.mousedown(_mousedown);
	$('body').mouseup(_mouseupWrapper);
	stateMachines[id] = sm; 
}

function evStartDragfn(id, fn){
	sm = getStateMachine(id);
	sm.startDragfn = fn; 
}

function evDragfn(id, fn){
	sm = getStateMachine(id);
	sm.dragfn = fn; 
}

function evStopDragfn(id, fn){
	sm = getStateMachine(id);
	sm.stopDragfn = fn; 
}

function evSetAux(id, aux){
	sm = getStateMachine(id);
	sm.aux = aux;
}

function evGetAux(id, aux){
	sm = getStateMachine(id)
	sm.aux = aux; 
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

function testAndFire (cb, pos){
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

function StateMachine(){
	//0 not captured
	//1 hover
	//2 mouse down in object		//3 mouse down outside object
	this.state= 0
	this.left= 0
	this.top= 0
	this.drag= false
	this.disabled= false
	this.coords= function (ev){
		pos = {}
		pos.y = ev.pageY - sm.top;
		pos.x = ev.pageX - sm.left; 
		return pos; 
	}
};

		

_move= function(ev){
	sm = getStateMachine(this.id);
	if(sm.disabled)
		return;
	pos = sm.coords(ev);
	if (sm.state == 0 || sm.state == 1)
		return;
	if (sm.state == 2){
		if (!sm.drag){
			testAndFire(sm.startDragfn, pos)
			sm.drag = true;
		}
		testAndFire(sm.dragfn, pos)
		
	}  
}

_mousein= function(ev){
	sm = getStateMachine(this.id);
	if (sm.disabled)
		return;
	pos = sm.coords(ev);
	if (sm.state == 0)
		sm.state = 1;
	if (sm.state == 3)
		sm.state = 2;	
}

_mouseout= function(ev){
	sm = getStateMachine(this.id);
	if (sm.disabled)
		return;
	pos = sm.coords(ev);
	if (sm.state == 2)
		sm.state = 3
	if (sm.state == 1)
		sm.state = 0
	
}

_mousedown= function(ev){
	sm = getStateMachine(this.id, ev);
	if(sm.disabled)
		return;
	pos = sm.coords(ev);
	if (sm.state == 1)
		sm.state = 2;
}		 

_mouseup= function(ev, sm){
	if (sm.disabled)
		return;
	pos = sm.coords(ev);
	if (sm.state == 2){
		sm.state = 1;
		if(!sm.drag)
			testAndFire(sm.clickfn, pos)
	}
	if (sm.state == 3){
		sm.state = 0;
	}
	if(sm.drag){
		testAndFire(sm.stopDragfn, pos);  
		sm.drag=false; 
	}

}

_mouseupWrapper = function (ev){
	for (var sm in stateMachines){
		_mouseup(ev, stateMachines[sm]); 
	}
}