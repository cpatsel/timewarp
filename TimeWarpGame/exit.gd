extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	pass # Replace with function body.


func _on_exit_body_entered(body):
	get_tree().change_scene('res://Select.tscn')
#	pass
