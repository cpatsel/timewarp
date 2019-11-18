extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var origin_pos
var origin_vis
var origin_col

# Called when the node enters the scene tree for the first time.
func _ready():
	origin_pos = get_position()
	origin_vis = visible
	origin_col = get_node("CollisionShape2D").disabled

func _anchor():
	origin_pos = get_position()
	origin_vis = visible
	origin_col = get_node("CollisionShape2D").disabled
	
func _reset():
	set_position(origin_pos)
	visible = origin_vis
	get_node("CollisionShape2D").set_deferred('disabled', origin_col)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
