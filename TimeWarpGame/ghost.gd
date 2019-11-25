extends KinematicBody2D


var time_start = 0
var time_now = 0
var elapsed = 0
var recordsize = 100
var counter = 0
var f = Vector2(0,0)
var Ghost = {
    pos = [],
    time = []
    }
var used = false
var loop = -1

func _ready():
	time_start = OS.get_ticks_msec()
	set_process(true)


func _anchor():
	used = false
	loop = -1
	hide()
	
func _reset(player_origin, player_ghost, player_loop):
	if (!used):
		used = true
		Ghost = player_ghost
		loop = player_loop
		show()
	position = player_origin
	counter = 0

func _process(delta):
    time_now = OS.get_ticks_msec()
    var elapsed = time_now - time_start
    #print("ghost elapsed : ", elapsed)
    #self._ghosting()

    if (used):
        if (counter < recordsize):
            if(get_node("/root/colworld/player").loopcount >= loop):
                recordsize = Ghost.pos.size()
                self._ghosting()
    

func _ghosting():
    #get_node("/root/colworld/player").Ghost.time
    var f = Vector2(0,0)
    if (counter < recordsize):
        f = Ghost.pos[counter]
        position = f #get_node("/root/colworld/player").Ghost.pos[elapsed/100]
        counter = counter + 1


#func _physics_process(delta):
    #if(elapsed%100 == 0):
        #if (get_node("/root/colworld/player").Ghost.time == elapsed - 1000):
            #position = get_node("player").get("Ghost.position")
        
    
