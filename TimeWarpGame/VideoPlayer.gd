extends VideoPlayer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var time_start = 0
var time_now = 0
var elapsed = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	time_start = OS.get_ticks_msec()
	set_process( true )

	pass # Replace with function body.
func _process(delta):
	time_now = OS.get_ticks_msec()
	var elapsed = time_now - time_start
	if (elapsed > 28000):
		get_tree().change_scene('res://tutorial1.tscn')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_Finished():
	print("stuf happun")
	get_tree().change_scene('res://tutorial1.tscn')
	#pass
