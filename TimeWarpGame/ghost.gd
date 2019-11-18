extends KinematicBody2D


var time_start = 0
var time_now = 0
var elapsed = 0
var recordsize = 100
var counter = 0
var f = Vector2(0,0)

var used = false



func _ready():
	time_start = OS.get_ticks_msec()
	set_process(true)


func _anchor():
	used = false
	hide()
	
func _reset(player_origin):
	if (used):
		position = player_origin
		counter = 0
		show()
	else:
		used = true

func _process(delta):
    time_now = OS.get_ticks_msec()
    var elapsed = time_now - time_start
    #print("ghost elapsed : ", elapsed)
    #self._ghosting()


    if (counter < recordsize):
        if(get_node("/root/colworld/player").loopcount == 1):
            recordsize = get_node("/root/colworld/player").Ghost.pos.size()
            self._ghosting()
    

func _ghosting():
    #get_node("/root/colworld/player").Ghost.time
    var f = Vector2(0,0)
    if (counter < recordsize):
        f = get_node("/root/colworld/player").Ghost.pos[counter]
        position = f #get_node("/root/colworld/player").Ghost.pos[elapsed/100]
        counter = counter + 1


#func _physics_process(delta):
    #if(elapsed%100 == 0):
        #if (get_node("/root/colworld/player").Ghost.time == elapsed - 1000):
            #position = get_node("player").get("Ghost.position")
        
    
