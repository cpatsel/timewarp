extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var origin_pos
var origin_vis

# Called when the node enters the scene tree for the first time.
func _ready():
	origin_pos = get_position()
	origin_vis = visible
	
func _reset():
	set_position(origin_pos)
	visible = origin_vis
	get_node("anim").seek(0)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
